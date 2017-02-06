class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.string :employer
      t.string :location
      t.boolean :rating_recommendation
      t.integer :rating_goals
      t.integer :rating_objectives
      t.integer :rating_supervision
      t.integer :rating_learning
      t.integer :rating_remuneration
      t.integer :rating_atmosphere
      t.string :job_position
      t.string :department
      t.integer :internship_start_year
      t.string :internship_duration
      t.integer :net_salary_per_month

      t.boolean :extra_benefit_meal_voucher, default: false
      t.boolean :extra_benefit_transport_costs, default: false
      t.boolean :extra_benefit_insurance, default: false
      t.boolean :extra_benefit_accomodation, default: false

      t.string :professional_status
      t.boolean :contract_signed
      t.boolean :job_offered
      t.text :additional_comments
      t.string :reviewer_name
      t.string :reviewer_email
      t.boolean :read_conditions

      t.timestamps
    end
  end
end
