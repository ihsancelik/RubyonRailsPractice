class ProductPolicy < ApplicationPolicy
  def initialize(user, record)
    @user = user
    @record = record
  end

  def create?
    @user.present? && @user.admin?
  end

  def update?
    @user.present? && @user.admin?
  end

  def destroy?
    @user.present? && @user.admin?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
