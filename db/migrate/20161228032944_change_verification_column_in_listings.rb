class ChangeVerificationColumnInListings < ActiveRecord::Migration
  def change
  	remove_column :listings, :verification
  	add_column :listings, :verification, :boolean
  end
end
