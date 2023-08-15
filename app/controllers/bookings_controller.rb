class BookingsController < ApplicationController
  before_action :set_activity, only: [:create]

  def create
    @booking = Booking.new(booking_params)
    booking.activity = @activity
    @booking.save
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:date, :user_id, :activity_id)
  end
end
