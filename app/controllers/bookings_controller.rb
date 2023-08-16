class BookingsController < ApplicationController
  before_action :set_activity, only: [:create]

  def create
    @booking = Booking.new(booking_params)
    @booking.activity = @activity
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path(@booking)
    else
      render 'activities/show', status: :unprocessable_entity
    end
  end

  private

  def set_activity
    @activity = Activity.find(params[:activity_id])
  end

  def booking_params
    params.require(:booking).permit(:date, :user_id, :activity_id)
  end
end
