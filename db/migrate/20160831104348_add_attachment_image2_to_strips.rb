class AddAttachmentImage2ToStrips < ActiveRecord::Migration
  def self.up
    change_table :strips do |t|
      t.attachment :image2
    end
  end

  def self.down
    remove_attachment :strips, :image2
  end
end
