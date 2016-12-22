class Project < ActiveRecord::Base
  validates :title, presence: true
  validates :level, presence: true

  has_many :likes 
  has_many :ideas, dependent: :delete_all
  belongs_to :user
end
