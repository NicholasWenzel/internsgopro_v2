class ChangeNetSalaryToString < ActiveRecord::Migration
  def change
    change_column :ratings, :net_salary_per_month, :string
  end
end
