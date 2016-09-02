class AddStylingToComics < ActiveRecord::Migration
  def change
    add_column :comics, :strip_color, :string
    add_column :comics, :strip_background, :string
  end
end
