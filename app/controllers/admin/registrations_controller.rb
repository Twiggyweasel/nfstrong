module Admin
  # Registrations Controller for the Admin Namespace
  class RegistrationsController < ApplicationController
    layout 'admin'
    before_action :set_event, only: %i[index show new create edit update destroy]
    before_action :set_registration, only: %i[show edit update destroy]
    def index
      @q = @event.registrations.includes(:user).order('users.name asc').ransack(params[:q])
      @registrations = @q.result().page params[:page]
    end

    def show; end

    def new
      @registration = @event.registrations.new
    end

    def create
      @registration = @event.registrations.create(registration_params)
      if @registration.save
        flash[:success] = 'Registrations Successfully Created'
        redirect_to admin_event_registrations_path(@event)
      else
        render :new
      end
    end

    def edit; end

    def update
      if @registration.update(registration_params)
        flash[:success] = 'Registration Successfully Updated'
        redirect_to admin_event_registration_path(@event, @registration)
      else
        render :new
      end
    end

    def destroy
      @registration.destroy
      flash[:danger] = 'Registration Deleted'
      redirect_to admin_event_registrations_path(@event)
    end

    private

    def registration_params
      params.require(:registration).permit(:fee, :shirt_size, :accepted_terms, :paid, :active, :user_id)
    end

    def set_event
      @event = Event.find_by_slug(params[:event_id])
    end

    def set_registration
      @registration = Registration.find(params[:id])
    end
  end
end
