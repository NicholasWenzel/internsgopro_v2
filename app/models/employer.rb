class Employer < ActiveRecord::Base
  has_many :offers, dependent: :delete_all

  def offers_count
   self.offers.count
 end
end
