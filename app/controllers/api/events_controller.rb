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

  def recommended events
    #find top 3 recommended events for a user
    if current_user
      #change to current user
      User.all do |other_user|
        next if other_user == current_user

        current_user_events = Set.new (current_user.purchased_events.concat(current_user.bookmarked_events).unique)
        other_user_events = Set.new (other_user.purchased_events.concat(current_user.bookmarked_events).unique)

        events_intersection = current_user_events.intersection other_user
        events_union = current_user_events.union other_user_events

        jaccard_index = (events_intersection*1.0)/events_union
      end
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
