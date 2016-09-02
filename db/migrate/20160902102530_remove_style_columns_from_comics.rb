class RemoveStyleColumnsFromComics < ActiveRecord::Migration
  def change
    remove_column :comics, :strip_background, :string
    remove_column :comics, :strip_color, :string
    add_column :comics, :stripcolor, :string
    add_column :comics, :stripbackground, :string
  end
end
