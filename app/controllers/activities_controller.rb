class ActivitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @activities = Activity.all
  end

  def show
    @activity = Activity.find(params[:id])
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
    params.require(:activity).permit(:location, :description, :hourly_rate, :photo)
  end
end
