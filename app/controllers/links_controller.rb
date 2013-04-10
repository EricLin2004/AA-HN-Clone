class LinksController < ApplicationController

  def new
    verify_logged_in
    @link = Link.new
    # can only add up to 1 comment
    @link.comments.build
  end

  def create
    @link = Link.new(params[:link])

    if @link.save
      redirect_to links_url
    else
      flash.now[:errors] = @link.errors.full_messages
      render :new
    end
  end

  def show
    @link = Link.find(params[:id])
    @comments = Comment.where(:link_id => @link.id)
  end

  def index

  end

  def edit
  end

  def destroy
  end

  private
  def verify_logged_in
    unless logged_in?
      flash.now[:errors] = "Need to be logged in to add a link."
      render :index
    end
  end
end
