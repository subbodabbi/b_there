class AddImagesToListings < ActiveRecord::Migration
  def change
  	remove_column :listings, :image
    add_column :listings, :images, :json
  end
end
