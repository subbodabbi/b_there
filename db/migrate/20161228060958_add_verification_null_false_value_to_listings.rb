class AddVerificationNullFalseValueToListings < ActiveRecord::Migration
  def change
  	remove_column :listings, :verification
  	add_column :listings, :verification, :boolean, null: false, default: false
  end
end
