class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.references :user, index: true, foreign_key: true
      t.string :address
      t.integer :price
      t.string :title
      t.string :description

      t.timestamps null: false
    end
  end
end
