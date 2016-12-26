class FixCountryName < ActiveRecord::Migration
  def change
    rename_column :users, :address, :country
  end
end
