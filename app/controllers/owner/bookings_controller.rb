class Owner::BookingsController < ApplicationController
  def index
    @bookings = current_user.bookings_as_owner
  end
end
