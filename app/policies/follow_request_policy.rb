class FollowRequestPolicy < ApplicationPolicy
  attr_reader :user, :follow_request
  
  def initialize(user, follow_request)
    @user = user
    @follow_request = follow_request
  end

  def create?
    true
  end

  def destroy?
    user == follow_request.sender || user == follow_request.recipient
  end

  def update?
    user == follow_request.recipient || user == follow_request.sender
  end

  # Scope class
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end
    
    # This method defines which follow requests the user is allowed to view
    def resolve
      scope.where(sender_id: user.id).or(scope.where(recipient_id: user.id))
    end

  end

end
