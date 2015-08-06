class AddAttachmentAttachmentToWorkshopExtras < ActiveRecord::Migration
  def self.up
    change_table :workshop_extras do |t|
      t.attachment :attachment
    end
  end

  def self.down
    remove_attachment :workshop_extras, :attachment
  end
end
