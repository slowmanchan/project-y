class AddIdeasCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ideas_count, :integer
  end
end
