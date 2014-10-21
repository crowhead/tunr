class SessionsController < ApplicationController

  def new
  end

  def create
    # find user by their email
    user = User.find_by(email: params[:session][:email].downcase)

    # test if the user was found and authenticates
    if user && user.authenticate(params[:session][:password])
      # TODO sign in the user
    else
      flash[:error] = "Invalid email/password"
      redirect_to new_sessions_path
    end
  end

  def destroy
  end

end
