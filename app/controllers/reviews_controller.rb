class ReviewsController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create]

  def new
    @movie = Movie.find(params[:movie_id])
    @review = Review.new
  end

  def edit
    @movie = Movie.find(params[:movie_id])
    @review = Review.find(params[:id])
    if current_user != @review.user
      redirect_to account_reviews_path, alert: "你没有编辑评论权限！"
    else
      render :edit
    end
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @review = Review.new(review_params)
    @review.movie = @movie
    @review.user = current_user

    if @review.save
      redirect_to movie_path(@movie)
    else
      render :new
    end
  end

  def update
    @movie = Movie.find(params[:movie_id])
    @review = Review.find(params[:id])
    if current_user != @review.user
      redirect_to account_reviews_path, alert: "你没有编辑评论权限！"
    end
    if @review.update(review_params)
      redirect_to account_reviews_path, alert: "编辑评论成功！"
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    @review = Review.find(params[:id])
    if current_user != @review.user
      redirect_to account_reviews_path, alert: "你没有删除评论权限！"
    else
      @review.destroy
      redirect_to account_reviews_path, alert: "删除评论成功！"
    end
  end


  private

  def review_params
    params.require(:review).permit(:content)
  end
end
