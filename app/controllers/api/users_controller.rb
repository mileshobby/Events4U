class Api::UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user
      debugger;

      log_in(@user)
      render :show
    elsif @user.errors
      debugger;

      render json: @user.errors.full_messages, status: 400
    else
      debugger;

      render json: ["Username already taken"], status: 400
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
