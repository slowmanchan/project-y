class Role < ActiveRecord::Base
  belongs_to :user
  belongs_to :idea
  belongs_to :project
end
