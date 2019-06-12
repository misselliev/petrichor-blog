# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = 'You have logged in!'
      redirect_to user_path(user)
    else
      flash.now[:danger] = 'There was something wrong with your information'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'You logged out! See you soon!'
    redirect_to root_path
  end
end
