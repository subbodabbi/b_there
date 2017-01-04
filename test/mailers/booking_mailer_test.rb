require 'test_helper'

class BookingMailerTest < ActionMailer::TestCase
  def booking_email	
    BookingMailer.booking_email(Booking.first).deliver_later
  end
  
end
