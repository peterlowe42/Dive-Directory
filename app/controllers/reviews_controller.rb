class ReviewsController < ApplicationController

  def new
    if logged_in?
      @user = current_user
      @divesite = Divesite.find_by(id: params[:divesite_id])
      @review = Review.new
    else
      flash[:error] = "You must be logged in to post a review"
      redirect_to login_path
    end
  end

  def create
    @divesite = Divesite.find(params[:divesite_id])
    @user = current_user
    review = Review.new(review_params)
    review.user = @user
    review.convert_units if @user.units == "Imperial"
    if review.save
      @divesite.reviews << review
      redirect_to divesite_path(@divesite)
    else
      render 'new'
    end
  end

  def edit
    @user = current_user
    @divesite = Divesite.find(params[:divesite_id])
    @review = Review.find(params[:id])
    if @user.units == "Imperial"
      @review.vis *= 3.28084
      @review.temp = (((@review.temp * 9)/5)+32).to_i
    end
  end

  def update
    @divesite = Divesite.find(params[:divesite_id])
    @review = Review.find(params[:id])
    @review.update(review_params)
    @review.convert_units if @user.units == "Imperial"
    @review.save
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