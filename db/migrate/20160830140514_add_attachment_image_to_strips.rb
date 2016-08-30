class AddAttachmentImageToStrips < ActiveRecord::Migration
  def self.up
    change_table :strips do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :strips, :image
  end
end
