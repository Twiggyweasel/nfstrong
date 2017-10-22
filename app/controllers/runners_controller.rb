# Runners controller
class RunnersController < ApplicationController
  before_action :set_user, only: %i[show new create]
  before_action :set_runner, only: %i[show]
  def index
    @runners = Runner.all
  end

  def show; end

  def new
    @runner = @user.runners.new
  end

  def create
    @runner = @user.runners.create(runner_params)
    if @runner.save
      flash[:success] = 'Runner Created'
      redirect_to user_runner_path(@user, @runner)
    else
      render :new
    end
  end

  def update

  end

  def destroy

  end

  private

  def runner_params
    params.require(:runner).permit(:event, :event_url, :goal, :city, :state, :date, :user_id)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_runner
    @runner = Runner.find(params[:id])
  end
end