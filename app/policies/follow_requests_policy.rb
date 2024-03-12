class FollowRequestsPolicy < ApplicationPolicy
  attr_reader :user, :follow_requests

  def initialize(user,follow_requests)
    @user = user
    @follow_requests = follow_requests
  end 

  def create?
    true
  end

  def destroy?
    user == follow_requests.recipient || user == follow_requests.sender
  end

  def update?
    destroy?
  end
