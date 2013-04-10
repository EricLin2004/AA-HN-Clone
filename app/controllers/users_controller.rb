class UsersController < ApplicationController
  def new
  end

  def create
    #save a user
    @user = User.new(params[:user])
    if @user.save
      #update and save the email addresses
      #params[:user][:emails_attributes]
      redirect_to links_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render "sessions/new"
    end
  end

  def show
  end

  def edit
  end

  def destroy # REV: Content here?
  end
end
