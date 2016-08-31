class AddCaption1ToStrip < ActiveRecord::Migration
  def change
    add_column :strips, :caption1, :string
    add_column :strips, :caption2, :string
    add_column :strips, :caption3, :string
  end
end
