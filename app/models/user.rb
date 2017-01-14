class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :groups
  has_many :meetings
  has_many :projects
  has_many :ideas
  has_many :likes
  has_many :idea_likes
  has_many :notifications, foreign_key: :recipient_id
  has_many :conversations
  has_many :messages

  scope :excluding_archived, -> { where(archived_at: nil) }

  def likes?(project)
    project.likes.where(user_id: id).any?
  end

  def groups?(project)
    project.groups.where(user_id: id).any?
  end

  def to_s
    "#{email} (#{admin? ? 'Admin' : 'User'})"
  end

  def archive
    update(archived_at: Time.now)
  end

  def active_for_authentication?
    super && archived_at.nil?
  end

  def inactive_message
    archived_at.nil? ? super : :archived
  end
end
