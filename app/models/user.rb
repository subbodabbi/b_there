class User < ActiveRecord::Base
  include Clearance::User

  has_many :authentications, :dependent => :destroy

  def name(full_name)
    full_name = "#{first_name} #{last_name}".strip
  end

  def self.create_with_auth_and_hash(authentication, auth_hash)
   create! do |u|
      u.name(auth_hash["extra"]["raw_info"]["name"])
      u.email = auth_hash["extra"]["raw_info"]["email"]
      u.password = SecureRandom.hex(3)
      u.authentications<<(authentication)
    end
  end

  def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end


end
