class BookingMailer < ApplicationMailer

  def booking_email(customer, host, booking_id)
    @customer = customer
    @host = host
    @url = "http://localhost:3000/booking/" + booking_id.to_s
    mail(to: @customer.email, subject: 'Confirmation of BnB There Booking')
  end

end
