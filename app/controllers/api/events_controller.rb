require 'set'

class Api::EventsController < ApplicationController

  def index
    @events = Event.includes(:categories).all
    if current_user
      @bookmarked_events = current_user.bookmarked_events
    else
      @bookmarked_events = []
    end
  end

  def create
    @event = Event.new(event_params)
    @event.host = current_user
    if @event.save
      @host = @event.host
      @event.category_ids = params[:event][:category_ids]
      render :show
    else
      render json: @event.errors.full_messages, status: 400
    end
  end

  def destroy
    @event = Event.find_by(id: params[:id])
    if @event
      @event.destroy
      render json: {}
    else
      render json: ["We could not find this event in our database."], status: 404
    end
  end

  def update
    @event = Event.find_by(id: params[:id])
    if @event && @event.user == current_user
      if @event.update_attributes(event_params)
        @host = event.host
        render :show
      else
        render json: @event.errors.full_messages, status: 400
      end
    elsif @event #case that the user tried to update an event that was not theirs
      render json: ["You can only update events that you are hosting!"], status: 400
    else #case event was not found
      render json: ["We could not find this event in our database."], status: 404
    end
  end

  def show
    @event = Event.find_by(id: params[:id])
    if @event
      @host = @event.host
      render :show
    else
      render json: ["We could not find this event in our database."], status: 404
    end
  end

  def filter
    #BY CATEGORY
    categories = Category.where(name: params[:category_names])
    @events = []
    categories.each do |category|
      @events.concat(category.events.includes(:categories))
    end
    if current_user
      @bookmarked_events = current_user.bookmarked_events
    else
      @bookmarked_events = []
    end
    render :index
  end

  def hosted_events
    @events = current_user.events.includes(:categories)
    if current_user
      @bookmarked_events = current_user.bookmarked_events
    else
      @bookmarked_events = []
    end
    render :index
  end

  def bookmarked_events
    @events = current_user.bookmarked_events.includes(:categories)
    if current_user
      @bookmarked_events = current_user.bookmarked_events
    else
      @bookmarked_events = []
    end
    render :index
  end

  def attended_events
    @events = current_user.purchased_events.includes(:categories)
    if current_user
      @bookmarked_events = current_user.bookmarked_events
    else
      @bookmarked_events = []
    end
    render :index
  end

  def search
    @events = Event.where("title LIKE ? OR full_description LIKE ?",
              "%#{params[:search_string]}%", "%#{params[:search_string]}%")
    if current_user
      @bookmarked_events = current_user.bookmarked_events
    else
      @bookmarked_events = []
    end
    render :index
  end

  def recommended_events
    #find top 3 recommended events for a user
    if current_user
      #compare all users to current user and find the most similar ones
      #set of all events associated with current_user
      current_user_events = current_user.purchased_events.to_a.concat(current_user.bookmarked_events.to_a).to_a.uniq
      similarity_scores = []
      @all_users = User.includes(:bookmarked_events, :purchased_events).all.to_a
      @all_users.each do |other_user|
        next if other_user == current_user
        #set of all events associated with other user
        other_user_events = (other_user.purchased_events).to_a.concat(other_user.bookmarked_events.to_a).uniq
        events_intersection = current_user_events & other_user_events
        events_union = current_user_events | other_user_events
        if events_intersection.count > 0
          jaccard_index = (events_intersection.count*1.0)/events_union.count
        else
          next
        end

        similarity_scores.push([jaccard_index, other_user])
      end

      #sort by highest jaccard index (most similar user)
      similarity_scores = similarity_scores.sort_by{|score| score[0]}.reverse!

      #look through most similar users and try to find 3 events in other_user that
      #current_user has not saved or purchased
      recommended_events = []
      similar_users = similarity_scores.map { |score| score[1] }
      similar_users.each do |user|
        other_user_events = (user.purchased_events).to_a.concat(user.bookmarked_events.to_a).uniq
        #set difference
        new_events = other_user_events - current_user_events
        new_events.each do |event|
          recommended_events.push(event)
          break if recommended_events.count == 3
        end
        break if recommended_events.count == 3
      end

      #if we still haven't found 3 events, place 3 random new events in recommendations
      num_events_needed = 3 - recommended_events.count
      if num_events_needed > 0
        events = Event.where('id NOT in (?)', current_user_events).to_a.sample(num_events_needed)
        recommended_events.push(events)
      end

      @events = recommended_events
      @bookmarked_events = current_user.bookmarked_events
      render :index
    else
      render json: {}
    end
  end

  private

  def event_params
    params
    .require(:event)
    .permit(:title, :full_description,
            :image_url, :date, :total_quantity,
            :quantity_left, :price, :city_state_zip, :venue, :street_address)
  end

end
