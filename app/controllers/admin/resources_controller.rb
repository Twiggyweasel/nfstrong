module Admin
  # Resources Controller for Admin Namespace
  class ResourcesController < ApplicationController
    before_action :set_event, only: %i[index show edit update destroy]
    before_action :set_resource, only: %i[show edit update destroy]

    def index
      @resources = @event.resources.all
    end

    def show; end

    def new; end

    def create; end

    def edit; end

    def update; end

    def destroy; end

    private

    def resource_params
      params.require(:resource).permit(:name, :url)
    end

    def set_event
      @event = Event.find_by_slug(params[:event_id])
    end

    def set_resource
      @resource = Resource.find(params[:id])
    end
  end
end
