class ReviewsController < ApplicationController

  def new
    if logged_in?
      @divesite = Divesite.find_by(id: params[:divesite_id])
      @review = Review.new
    else
      flash[:danger] = "You must be logged in to post a review"
      redirect_to login_path
    end
  end

  def create
    @divesite = Divesite.find_by(params[:divesite_id])
    @user = current_user
    @divesite.reviews << Review.create(title: params[:review][:title], rating: params[:review][:rating], body: params[:review][:body], user_id: current_user.id)
    redirect_to divesite_path(@divesite)
  end



end