class Employer < ActiveRecord::Base
  has_many :offers, dependent: :delete_all
end
