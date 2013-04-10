class SessionsController < ApplicationController
  def new
    @user = User.new
    3.times { @user.emails.build }
  end

  def create
    #params[:user][:name], params[:user][:password]
    if log_in(params[:user][:name], params[:user][:password])
      redirect_to root_url
    else
      flash.now[:errors] = "Invalid user/password combination."
      render :new
    end
  end

  def show
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
