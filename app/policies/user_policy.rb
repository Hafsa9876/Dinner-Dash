class UserPolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  def update?
    user.id == record.id
  end

  def show?
    puts "Record class: #{record.class}" # Debugging output
    user.id == record.id
  end
end
