class SessionsController < ApplicationController
  def new
    @title = "Sign in"
  end

  def create
    user = User.authenticate(params[:session][:email], params[:session][:password])
    if user.nil?
      flash.now[:error] = "Invalid email/password combination. Did you forget your password?"
      @title = "Sign in"
      render 'new'
    else
      sign_in user
      flash[:success] = "Welcome, #{user.name}!"
      redirect_to user
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end
