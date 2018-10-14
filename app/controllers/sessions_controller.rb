class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      flash.now[:info] = 'You are authenticated.'
      redirect_to cookies.delete(:last_path) || tests_path
    else
      flash.now[:alert] = 'Are You a Guru? Verify your Email and Password please.'
      render :new
    end
  end

  def destroy
    if cookies[:_test_guru_session] 
      session[:user_id] = nil
      flash.now[:info] = 'You are logout.'
      redirect_to root_path
    else
      flash.now[:info] = 'You should login.'
      redirect_to root_path
    end
  end
end
