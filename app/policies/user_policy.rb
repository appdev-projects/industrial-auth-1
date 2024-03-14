class UserPolicy < ApplicationPolicy
  attr_reader :current_user, :user

  def initialize(current_user, user)
    @current_user = current_user
    @user = user
  end

    def show?
      true
    end

    def feed?
      current_user_view?
    end

    def discover?
      current_user_view?
    end

    def followers?
      visible?
    end

    def following?
      visible?
    end

    def liked?
      visible?
    end
  
    def visible?
      user == current_user || !user.private? ||
      user.followers.include?(current_user)
    end

    def current_user_view?
      user == current_user
    end

end
