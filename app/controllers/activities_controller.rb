class ActivitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @activities = if params[:query].present?
      Activity.search_by_name(params[:query])
    else
      Activity.all
    end
    @no_activities_found = @activities.empty?

    @activity = Activity.new
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
    @activity = Activity.new(activity_params)
    @activity.user = current_user

    if @activity.save
      redirect_to activity_path(@activity)
    else
      render partial: 'create_activity', layout: false
    end
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :location, :description, :hourly_rate, :photo)
  end
end
