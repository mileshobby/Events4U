class Api::EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def create
    @event = Event.new(event_params)
    @event.host = current_user
    if @event.save
      render :show
    else
      render json: @event.errors_full_messages, status: 400
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

  def event_params
    params
    .require(:events)
    .permit(:title, :short_description, :full_description,
            :image_url, :date, :total_quantity,
            :quantity_left, :price, :city_state_zip, :address)
  end

end
