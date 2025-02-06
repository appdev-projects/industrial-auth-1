class FollowRequestPolicy < ApplicationPolicy
  attr_reader :user, :follow_request

  def initialize(user, follow_request)
    @user = user
    @follow_request = follow_request
  end

  def show?
    @user == @follow_request.recipient
  end

  def new?
    @user == @follow_request.sender
  end

  def edit?
    true
  end

  def create?
    new?
  end

  def update?
    true
  end

  def destroy?
    true
  end
end
