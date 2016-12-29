class Listing < ActiveRecord::Base
  belongs_to :user
  acts_as_taggable
  mount_uploaders :images, ImageUploader
end
