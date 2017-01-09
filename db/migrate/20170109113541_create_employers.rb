class CreateEmployers < ActiveRecord::Migration
  def change
    create_table :employers do |t|
      t.string :name
      t.string :country
      t.string :city
      t.string :sector
      t.binary :label
      t.binary :logo
      t.binary :photo
      t.binary :video
      t.string :descr0_title
      t.text :descr0_full
      t.string :descr1_title
      t.text :descr1_full
      t.string :descr2_title
      t.text :descr2_full

      t.timestamps null: false
    end
  end
end
