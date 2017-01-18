class AddEmployerToOffers < ActiveRecord::Migration
  def change
    add_reference :offers, :employer, index: true, foreign_key: true
  end
end
