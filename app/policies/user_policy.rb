class UserPolicy < ApplicationPolicy
  attr_reader :current_user, :user

def feed?
  true
end

def initialize(current_user, user)
    @current_user = current_user
    @user = user
end

def show?
  user == current_user ||
  !user.private? || 
  user.followers.include?(current_user)
end

def show_pending?
  current_user == user
end
end
