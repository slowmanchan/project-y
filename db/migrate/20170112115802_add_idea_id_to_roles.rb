class AddIdeaIdToRoles < ActiveRecord::Migration
  def change
    add_column :roles, :idea_id, :integer
  end
end
