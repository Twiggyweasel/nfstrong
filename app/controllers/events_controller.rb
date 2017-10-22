# Controller for event model
class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy donations]

  def index
    @events = Event.all
  end

  def show; end

  def donations
    @donations = @event.donations
  end

  private

  def set_event
    @event = Event.find_by_slug(params[:id])
  end
end
