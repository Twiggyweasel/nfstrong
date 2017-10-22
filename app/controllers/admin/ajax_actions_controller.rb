module Admin
  # Controller for admin ajax actions
  class AjaxActionsController < ApplicationController
    def event_refresh
      @event = Event.find_by_slug(params[:id])
      redirect_to admin_event_path(@event)
    end
  end
end