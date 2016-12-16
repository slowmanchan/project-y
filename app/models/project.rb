class Project < ActiveRecord::Base
  validates :title, presence: true
  validates :level, presence: true

  has_many :ideas, dependent: :delete_all
end
