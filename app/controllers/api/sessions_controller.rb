class Api::SessionsController < ApplicationController
  def create
    @user = User.find_by_credentials(params[:user][:username],
                                     params[:user][:password])
    if @user
      log_in(@user)
      render json: @user #MAYBE CHANGE THIS TO A PARTIAL
    else
      render json: @user.errors.full_messages, status: 400
    end
  end

  def destroy
    if logged_in?
      log_out
    else
      render json: ["Cannot log out without being signed in."], status: 400
    end
  end
  
end
