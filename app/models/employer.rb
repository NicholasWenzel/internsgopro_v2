class Employer < ActiveRecord::Base
  has_many :offers, dependent: :delete_all

mount_uploader :attachment, AttachmentUploader
  def offers_count
   self.offers.count
 end

end
