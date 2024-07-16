class UserPolicy < ApplicationPolicy
  attr_reader :current_user, :user

def initialize(current_user, user)
    @current_user = current_user
    @user = user
end


def show?
true
end

def show_profile_nav?
  user == current_user ||
  !user.private? || 
  user.followers.include?(current_user)
end



def show_pending?
  user == current_user 
end

def feed?
  current_user == user
end


def discover?
  current_user == user
end 


def new?
  current_user == user
end

def liked?
  user == current_user ||
  !user.private? || 
  user.followers.include?(current_user)
end
end
