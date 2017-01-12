class Project < ActiveRecord::Base
  validates :title, presence: true
  validates :level, presence: true

  acts_as_taggable

  has_many :groups
  has_many :likes
  has_many :ideas, dependent: :delete_all
  belongs_to :user
  has_many :users, through: :ideas
  has_many :roles, dependent: :delete_all
end
