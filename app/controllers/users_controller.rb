# Users Controller for Public Namespace
class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  def index; end

  def show; end

  def new; end

  def create; end

  def edit; end

  def udpate; end

  def destroy; end

  private

  def user_params
    params.require(:user).permit()
  end

  def set_user
    @user = User.find(1)
  end
end
