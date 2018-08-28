class HousePolicy < ApplicationPolicy

    def create?
      return true
    end

    def new?
      return false
    end

    def index?
      return true
    end

    def show?
      return true
    end

    # def edit?
    #  record.user == user
    # end

    # def update?
    #   record.user == user
    # end

    # def destroy?
    #   record.user == user
    # end

    # def is_admin?
    #   user.admin
    # end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
