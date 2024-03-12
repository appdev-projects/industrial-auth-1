# app/policies/user_policy.rb

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
    user == current_user
  end

  def discover?
    user == current_user
  end
  
  def liked?
    true
  end

  def hide_photo?
    #need to rework logic, breaking
  end

  def see_follow_request_button?
    user != current_user
  end
end
