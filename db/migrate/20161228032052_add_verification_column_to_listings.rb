class AddVerificationColumnToListings < ActiveRecord::Migration
  def change
  	add_column :listings, :verification, :string 
  end
end
