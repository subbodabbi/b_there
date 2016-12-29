class Listing < ActiveRecord::Base
  belongs_to :user
  has_many :bookings
  acts_as_taggable
  mount_uploaders :images, ImageUploader
end
