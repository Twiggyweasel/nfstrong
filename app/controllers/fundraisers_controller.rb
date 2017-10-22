# Controller for Fundraiser Model
class FundraisersController < ApplicationController
  before_action :set_event, only: %i[new create]

  def new
    @fundraiser = @event.fundraisers.new
  end

  def create
    @fundraiser = @event.fundraisers.create(fundraiser_params)
    if @fundraiser.save
      flash[:success] = 'Registration to Fundraise Successfully Created!'
      redirect_to @event
    else
      render :new
    end
  end

  private

  def fundraiser_params
    params.require(:fundraiser).permit(:shirt_size, :to_raise, :raised, :goal_met, :accepted_terms, :event_id)
  end

  def set_event
    @event = Event.find(params[:event_id])
  end
end
