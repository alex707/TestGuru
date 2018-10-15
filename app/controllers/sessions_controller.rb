class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:info] = 'You are authenticated.'
      redirect_to cookies.delete(:last_path) || tests_path
    else
      flash.now[:alert] = 'Are You a Guru? Verify your Email and Password please.'
      render :new
    end
  end

  def destroy
    if logged_id? 
      session.delete(:user_id)
      flash[:info] = 'You are logout.'
      redirect_to root_path
    else
      flash[:info] = 'You should login.'
      redirect_to root_path
    end
  end
end
