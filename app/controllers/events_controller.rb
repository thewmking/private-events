class EventsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :index, :show, :new]
  def index
    @future_events = Event.future
    @past_events   = Event.past
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    @event.save
    redirect_to @event
  end

  def show
    @event = Event.find(params[:id])

    @comment = @event.comments.build(user_id: current_user.id)
    @attendees = @event.attendees
    if @attendees.include?(current_user)
      @attendee = Attending.find_by(event_id: @event.id, attendee_id: current_user.id)
    else
      @attendee = @event.attendings.build(attendee_id: current_user.id)
    end
    @comment_feed = @event.comments.where("content != ?", '').all
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      flash[:success] = "Event updated!"
      log_in @event
      redirect_to @event
    else
      flash[:warning] = "Error updating event. Please try again."
      render 'edit'
    end
  end

  def destroy
    Event.find(params[:id]).destroy
  end

  private
    def event_params
      params.require(:event).permit(:name, :creator, :location, :date, :description)
    end

end
