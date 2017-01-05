class Idea < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true

  belongs_to :project
  belongs_to :user, :counter_cache => true
end
