class Listing < ActiveRecord::Base
  belongs_to :user
  has_many :bookings
  acts_as_taggable
  mount_uploaders :images, ImageUploader
  scope :min_price, -> (min) { where("price > ?", "#{min}%") }
  scope :max_price, -> (max) { where("price < ?", "#{max}%") }
  scope :guest_num, -> (max_guests) { where("max_guests >= ?", "#{max_guests}%")}   

  def self.search(search)
    where('title LIKE :search OR address LIKE :search OR description LIKE :search', search: "%#{search}%")
  end

end
