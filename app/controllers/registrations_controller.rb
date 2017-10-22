# Registrations Controller for Registeration Model
class RegistrationsController < ApplicationController
  before_action :set_event, only: %i[new create]

  def index;  end

  def new
    @registration = @event.registrations.new
  end

  def create
    @registration = @event.registrations.create(registration_params)
    if @registration.save
      flash[:notice] = 'Registration was successfully created.'
      redirect_to(@event)
    else
      render :new
    end
  end

  private

  def registration_params
    params.require(:registration).permit(:fee, :raised, :shirt_size, :paid, :active, :accepted_terms, :event_id)
  end

  def set_event
    @event = Event.find_by_slug(params[:event_id])
  end
end
