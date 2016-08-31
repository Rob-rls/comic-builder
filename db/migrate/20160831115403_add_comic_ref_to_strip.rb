class AddComicRefToStrip < ActiveRecord::Migration
  def change
    add_reference :strips, :comic, index: true, foreign_key: true
  end
end
