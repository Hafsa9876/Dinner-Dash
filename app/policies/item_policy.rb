# frozen_string_literal: true

# This is Documentation
class ItemPolicy < ApplicationPolicy
  def edit
    user.admin?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end

  def new?
    user.admin?
  end

  def create?
    user.admin?
  end
end
