class Listing < ActiveRecord::Base
  belongs_to :user
  has_many :bookings
  acts_as_taggable
  mount_uploaders :images, ImageUploader
  scope :price, -> (status) { where status: status }
  scope :address, -> (location_id) { where location_id: location_id }
  scope :guest_num, -> (name) { where("name like ?", "#{name}%")} 
end
