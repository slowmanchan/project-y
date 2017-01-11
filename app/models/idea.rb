class Idea < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true

  has_many :idea_likes
  belongs_to :project
  belongs_to :user, :counter_cache => true
end
