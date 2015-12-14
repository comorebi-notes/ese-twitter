class ChangeColorToUser < ActiveRecord::Migration
  def up
    rename_column :users, :color, :old_color
    add_column    :users, :color, :integer
    remove_column :users, :old_color
  end
end
