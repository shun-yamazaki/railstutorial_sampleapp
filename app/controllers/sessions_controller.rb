class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # GET /users/user[:id]へリダイレクト
      log_in user
      redirect_to user # redirect_to user_url(user)の省略形(GET /users/user[:id])
    else
      flash.now[:danger] = 'Invalid email/password combination' 
      render 'new'
    end
  end

  def destroy
  end
end
