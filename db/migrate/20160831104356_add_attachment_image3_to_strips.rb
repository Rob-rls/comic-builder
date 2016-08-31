class AddAttachmentImage3ToStrips < ActiveRecord::Migration
  def self.up
    change_table :strips do |t|
      t.attachment :image3
    end
  end

  def self.down
    remove_attachment :strips, :image3
  end
end
