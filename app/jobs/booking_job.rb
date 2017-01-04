class BookingJob < ActiveJob::Base
  queue_as :default

  def perform(customer, host, booking_id)
    BookingMailer.booking_email(customer, host, booking_id).deliver_later
  end

end