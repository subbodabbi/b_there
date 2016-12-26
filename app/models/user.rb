class User < ActiveRecord::Base
  include Clearance::User

validates :first_name, :last_name, :country, :phone_number, presence: true

end
