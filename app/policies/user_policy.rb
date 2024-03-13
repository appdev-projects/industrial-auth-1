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

  def view_private_profile_content?
    Rails.logger.debug "Private: #{user.private?}, Current User: #{current_user.id}, User: #{user.id}, Followers: #{user.followers.map(&:id)}"
    !user.private? || user == current_user || user.followers.include?(current_user)
  end

  def see_follow_request_button?
    !user.private? || current_user != user || user.followers.include?(current_user)
  end
end
