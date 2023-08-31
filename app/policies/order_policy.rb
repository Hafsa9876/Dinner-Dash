# frozen_string_literal: true

# This is Documentation
class OrderPolicy < ApplicationPolicy
  def index?
    user.admin? || (user.customer? && record.user == user)
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end

  def search?
    user.admin?
  end

  def show?
    user.admin? || user.id == record.user_id
  end
end
