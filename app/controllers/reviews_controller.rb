class ReviewsController < ApplicationController

  def new
    if logged_in?
      @user = current_user
      @divesite = Divesite.find_by(id: params[:divesite_id])
      @review = Review.new
    else
      flash[:danger] = "You must be logged in to post a review"
      redirect_to login_path
    end
  end

  def create
    @divesite = Divesite.find(params[:divesite_id])
    @user = current_user
    review = Review.create(review_params)
    review.update(user_id: current_user.id)
    @divesite.reviews << review
    redirect_to divesite_path(@divesite)
  end

  def edit
    @divesite = Divesite.find(params[:divesite_id])
    @review = Review.find(params[:id])
  end

  def update
    @divesite = Divesite.find(params[:divesite_id])
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to divesite_path(@divesite)
  end

  def destroy
    @divesite = Divesite.find(params[:divesite_id])
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to divesite_path(@divesite)
  end

private 

  def review_params
    params.require(:review).permit(:title, :dive_date, :vis, :vis_units, :temp, :temp_units, :current, :rating, :body)
  end

end