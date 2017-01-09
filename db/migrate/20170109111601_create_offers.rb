class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :name
      t.string :employer
      t.string :country
      t.string :city
      t.string :sector
      t.date :posted
      t.date :deadline
      t.integer :salary
      t.string :label
      t.string :type
      t.text :job_description
      t.text :candidate_profile
      t.text :organisation_description
      t.text :offer
      t.text :apply

      t.timestamps null: false
    end
  end
end
