module Admin
  # Controller for User Model in the Admin Namespace
  class UsersController < ApplicationController
    layout 'admin'
    before_action :set_user, only: %i[show edit update destroy]
    def index
      @q = User.all.ransack(params[:q])
      @users = @q.result().order(created_at: :desc).page params[:page]

      respond_to do |format|
        format.html
        format.js
      end
    end

    def show; end

    def new; end

    def create; end

    def edit; end

    def udpate; end

    def destroy
      @user.destroy
      flash[:danger] = 'User Successfully Deleted'
      redirect_to admin_users_path
    end

    private

    def user_params
      params.require(:user).permit()
    end

    def set_user
      @user = User.find(params[:id])
    end
  end
end
