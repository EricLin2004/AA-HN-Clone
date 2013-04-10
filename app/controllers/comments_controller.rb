class CommentsController < ApplicationController
  before_filter :verify_logged_in

  def new
    @comment = Comment.new
    @parent_comment = Comment.find(params[:comment_id])
    fail
    if params[:comment] #we know this is a comment on a comment
      @link = Link.find(params[:comment][:link_id])
    else
      @link = Link.find(params[:link_id])
    end
  end

  def create
    @comment = Comment.new(params[:comment])
    @link = Link.find(params[:link_id])
    @comment[:link_id] = @link.id

    if @comment.save
      redirect_to link_url(@link)
    else
      flash.now[:errors] = @comment.errors.full_messages
      render :new
    end
  end

  def destroy
  end

  private
  def verify_logged_in
    unless logged_in?
      flash[:errors] = "Need to be logged in to post a comment."
      redirect_to Link.find(params[:link_id].to_i)
    end
  end
end
