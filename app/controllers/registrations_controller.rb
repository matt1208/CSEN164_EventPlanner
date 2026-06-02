class RegistrationsController < ApplicationController
  before_action :require_user

  # POST 
  def create
    @event = Event.find(params[:event_id])
    @registration = @event.registrations.build(user: current_user, status: "Registered")

    if @registration.save
      redirect_to @event, notice: "Congratulations! You have registered for this event."
    else
      redirect_to @event, alert: "Registration failed: #{@registration.errors.full_messages.to_sentence}"
    end
  end

  # DELETE 
  def destroy
    @event = Event.find(params[:event_id])
    @registration = current_user.registrations.find_by(event_id: @event.id)

    if @registration
      @registration.destroy
      redirect_to @event, notice: "Your registration has been successfully canceled."
    else
      redirect_to @event, alert: "No registration found to cancel."
    end
  end
end