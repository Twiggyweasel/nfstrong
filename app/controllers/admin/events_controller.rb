module Admin
  # Controller for Event Model within Admin Namespace
  class EventsController < ApplicationController
    layout 'admin'
    before_action :set_event, only: %i[show edit update destroy settings transactions]
    def index
      @events = Event.all
    end

    def show; end

    def new
      @event = Event.new
    end

    def create
      @event = Event.create(event_params)
      if @event.save
        @event.initialize_event
        flash[:success] = 'Event Successfully Created'
        redirect_to admin_event_path(@event)
      else
        render :new
      end
    end

    def edit; end

    def update
      if @event.update(event_params)
        flash[:success] = 'Event has been updated'
        redirect_to admin_event_path(@event)
      else
        render :edit
      end
    end

    def destroy
      @event.destroy
      flash[:success] = 'Event has been deleted'
      redirect admin_events_path
    end

    def settings; end

    def transactions; end

    private

    def event_params
      params.require(:event).permit(:slug, :category, :banner_img, :card_img, :venue_name, :street, :state, :city, :zipcode, :desc, :goal, :event_start, :event_stop, :is_external, :is_private, :has_resources, :custom_slug)
    end

    def set_event
      @event = Event.find_by_slug(params[:id])
    end
  end
end
