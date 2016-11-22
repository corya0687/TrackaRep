class WorkoutPolicy < ApplicationPolicy

  def new?
    !user.nil?
  end

  def update?
    !user.nil? && record.try(:user) == user
  end
end
