class BookingsController < ApplicationController
before_action :find_booking, only: [:show, :destroy]

  def create
  	@listing = Listing.find(params[:listing_id])
  	@booking = current_user.bookings.new(booking_params)
  	@booking.listing = @listing
  	  if @booking.save
        BookingMailer.booking_email(current_user, @listing.user, @booking.id).deliver_later
  	  	redirect_to current_user
  	  else
  	  	@errors = @booking.errors.full_messages
  	  	render "listings/show"
  	  end
  end

  def destroy
  	@booking.destroy
  	redirect_to @booking.user
  end

  def show
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end

  private

	def booking_params
		params.require(:booking).permit(:num_guests, :start_date, :end_date)
  end

end
