class AddAttachmentToEmployers < ActiveRecord::Migration
  def change
    add_column :employers, :attachment, :string
  end
end
