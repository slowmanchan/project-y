class AddLevelToProject < ActiveRecord::Migration
  def change
    add_column :projects, :level, :integer
  end
end
