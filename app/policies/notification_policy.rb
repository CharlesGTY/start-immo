class NotificationPolicy < ApplicationPolicy

    def webhooks?
      true
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
