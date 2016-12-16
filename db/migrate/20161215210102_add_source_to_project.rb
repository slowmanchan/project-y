class AddSourceToProject < ActiveRecord::Migration
  def change
    add_column :projects, :source, :string
  end
end
