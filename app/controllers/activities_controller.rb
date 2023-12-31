class ActivitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @activities = Activity.all
    if params[:query].present?
      @activities = Activity.search_by_name(params[:query])
    else
      @activities = Activity.all
    end
  end

  def show
    @activity = Activity.find(params[:id])
    @review = Review.new
    @booking = Booking.new
  end

  # def new
  #   @activity = Activity.new
  # end

  def create
    @activity = Activity.create(activity_params)
    @activity.user = current_user
    @activity.save
    redirect_to activity_path(@activity)
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :location, :description, :hourly_rate, :photo)
  end
end
