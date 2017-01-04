class AddHelpToProject < ActiveRecord::Migration
  def change
    add_column :projects, :help, :boolean
  end
end
