class IdeaPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def update?
    user.try(:admin) || record.roles.exists?(user_id: user, role: 'manager')
  end

  def destroy?
    user.try(:admin) || record.roles.exists?(user_id: user, role: 'manager')
  end
end
