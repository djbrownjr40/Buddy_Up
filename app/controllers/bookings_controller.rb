class BookingsController < ApplicationController
  before_action :set_activity, only: [:create]

  def index
    @bookings = Booking.where(user: current_user)
    @bookings_as_owner = current_user.bookings_as_owner
  end

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

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to bookings_path, notice: "Booking status updated successfully."
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_activity
    @activity = Activity.find(params[:activity_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user_id, :activity_id, :status)
  end
end
