# frozen_string_literal: true

# This is Documentation
class CategoryPolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  def create?
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

  def show?
    user.admin?
  end
end
