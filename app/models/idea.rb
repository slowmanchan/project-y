class Idea < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true

  belongs_to :project
end
