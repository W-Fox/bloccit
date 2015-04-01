class PostPolicy < ApplicationPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.admin? || user.moderator?
        scope.all
      else scope.where(:id => user.id).exists?
      end
    end
  end


  def index?
    user.admin? || user.moderator? || user.id?
  end
end