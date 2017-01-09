class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :employer
      t.string :country
      t.string :sector
      t.integer :salary
      t.string :recommendation
      t.decimal :score

      t.timestamps null: false
    end
  end
end
