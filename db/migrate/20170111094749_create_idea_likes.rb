class CreateIdeaLikes < ActiveRecord::Migration
  def change
    create_table :idea_likes do |t|
      t.references :user, index: true, foreign_key: true
      t.references :project, index: true, foreign_key: true
      t.references :idea, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
