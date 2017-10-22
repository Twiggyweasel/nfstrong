# TODO; set payment route for online donations on successful create
# Donations controller
class DonationsController < ApplicationController
  before_action :set_context, only: %i[index new create edit update]
  def index
    @donations = @context.donations
  end

  def new
    @donation = @context.donations.new
  end

  def create
    @donation = @context.donations.new(donation_params)
    respond_to do |format|
      if @donation.save
        format.html { redirect_to @context }
        format.js
      else
        format.html { render :new }
        format.js
      end
    end
  end

  def edit
    @donation = Donation.find(params[:id])
  end

  def update
    @donation = @context.donations.update(donation_params)

    if @donation.save
      flash[:success] = 'Donation was successfully created.'
      redirect_to(@context)
    else
      render :new
    end
  end

  private

  def donation_params
    params.require(:donation).permit(:payee, :category, :amount, :honoree, :comment, :user_id)
  end

  def set_context
    @context = context
  end

  def context
    if params[:event_id]
      Event.find_by_slug(params[:event_id])
    elsif params[:registration_id]
      Registration.find(params[:registration_id])
    elsif params[:sponsor_id]
      Sponsor.find(params[:sponsor_id])
    elsif params[:fundraiser_id]
      Fundraiser.find(params[:fundraiser_id])
    end
  end
end
