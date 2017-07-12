class AttendingsController < ApplicationController

  def new
    @event = Event.find(params[:event_id])
  end

  def create
    event_id    = params[:attending][:event_id]
    attendee_id = current_user.id
    @attendee = Attending.new(event_id: event_id, attendee_id: attendee_id)
    @attendee.save
    if @attendee.save
      flash[:success] = "Reservation confirmed!"
      redirect_to event_path(event_id)
    end
  end

  def attendee_params
    params.require(:attending).permit(attending_attributes: [:attendee_id, :event_id])
  end

  def destroy
    id = params[:id]
    event_id = params[:attending][:event_id]
    @attendee = Attending.where(id: id).first
    @attendee.destroy
    flash[:success] = "RSVP Canceled"
    redirect_to event_path(event_id)
  end

end
