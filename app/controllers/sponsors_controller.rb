# Sponsor Controller for Sponsor Model
class SponsorsController < ApplicationController
  before_action :set_event, only: %i[new create]

  def new
    @sponsor = @event.sponsors.new
  end

  def create
    @sponsor = @event.sponsors.create(sponsor_params)
    if @sponsor.save
      flash[:success] = 'Sponsorship Successfully Created'
      redirect_to @event
    else
      render :new
    end
  end

  private

  def sponsor_params
    params.require(:sponsor).permit(:name, :logo, :category, :fee, :paid, :raised, :accepted_terms, :event_id)
  end

  def set_event
    @event = Event.find_by_slug(params[:event_id])
  end
end
