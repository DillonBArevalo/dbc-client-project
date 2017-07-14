class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def index
    @reviews = Review.recent
    @display = true
  end

  def show
    @review = Review.find(params[:id])
  end

  def film_new
    authenticate
    @film = Film.find(params[:film_id])
    @review = @film.reviews.new
    respond_to do |f|
      f.html
      f.js
    end
  end

  def film_create
    authenticate
    @film = Film.find(params[:film_id])
    @my_review = @film.reviews.new(review_params)
    if @my_review.save
      respond_to do |f|
        f.html {redirect_to @my_review}
        f.js
      end
    else
      @errors = @my_review.errors.full_messages
      render 'film_new'
    end
  end

  def actor_new
    authenticate
    @actor = Actor.find(params[:actor_id])
    @review = @actor.reviews.new
    respond_to do |f|
      f.html
      f.js
    end
  end

  def actor_create
    authenticate
    @actor = Actor.find(params[:actor_id])
    @my_review = @actor.reviews.new(review_params)
    if @my_review.save
      respond_to do |f|
        f.html {redirect_to @my_review}
        f.js
      end
    else
      @errors = @my_review.errors.full_messages
      render 'actor_new'
    end
  end

  def edit
    authenticate
    @review = Review.find(params[:id])
    check_user
  end

  def update
    authenticate
    @review = Review.find(params[:id])
    check_user
    if @review.update(review_params)
      redirect_to @review
    else
      @errors = @review.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    authenticate
    @review = Review.find(params[:id])
    reviewed = @review.reviewable
    check_user
    @review.destroy
    redirect_to reviewed
  end

  private

  def review_params
    params.require(:review).permit(:text, :user_id)
  end

  def authenticate
    redirect_to '/' unless current_user.trusted
  end

  def check_user
    redirect_to '/' unless @review.user == current_user
  end

end
