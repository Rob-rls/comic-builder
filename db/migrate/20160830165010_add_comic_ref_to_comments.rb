class AddComicRefToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :comic, index: true, foreign_key: true
  end
end
