class ReviewsController < ApplicationController
  before_action :set_activity, only: [:create]

  def create
    @review = Review.new(review_params)
    @review.activity_id = @activity
<<<<<<< HEAD
    @activity.user = current_user
=======
    @review.user_id = current_user
>>>>>>> a3a4608c60181096faca856c5df0389d7f17d98d
    if @review.save
      redirect_to activity_path(@activity)
    else
      render 'activities/show', status: :unprocessable_entity
    end
  end

  private

  def set_activity
    @activity = Activity.find(params[:activity_id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
