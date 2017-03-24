class ReviewsController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create]
  before_action :check_permission, only: [:new, :create, :edit, :update, :destroy]

  def new
    @review = Review.new
  end

  def edit
    @review = Review.find(params[:id])
    if current_user != @review.user
      redirect_to account_reviews_path, alert: "你没有编辑评论权限！"
    else
      render :edit
    end
  end

  def create
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
    @review = Review.find(params[:id])
    if current_user != @review.user
      redirect_to account_reviews_path, alert: "你没有删除评论权限！"
    else
      @review.destroy
      redirect_to account_reviews_path, alert: "删除评论成功！"
    end
  end


  private
  def check_permission
    @movie = Movie.find(params[:movie_id])
    if !current_user.is_member_of?(@movie)
      redirect_to movie_path(@movie), alert: "你还没有收藏电影，没有权限进行相应操作！"
    end
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
