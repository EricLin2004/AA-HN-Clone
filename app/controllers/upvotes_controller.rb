class UpvotesController < ApplicationController
  def new
  end

  def create
    #params[:link_id], session[:remember_token]
    #link_id = session[:link_id]
    #session[:link_id] = nil
    user = User.find_by_remember_token(session[:remember_token])
    @upvote = Upvote.new(link_id: params[:link_id], user_id: user.id)
    if @upvote.save
      redirect_to root_url
    else
      flash[:errors] = "Could not upvote."
      redirect_to root_url
    end
  end

  def destroy
    user = User.find_by_remember_token(session[:remember_token])
    @upvote = Upvote.where(:link_id => params[:link_id], :user_id => user.id)
    @upvote.destroy

    redirect_to root_url
  end
end
