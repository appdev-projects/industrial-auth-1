class CommentPolicy < ApplicationPolicy
  attr_reader :user, :comment

  def initialize(user,comment)
    @user = user
    @comment = comment
  end 

  def edit?
    update?
  end

  def update?
    user == comment.author
  end

  def destroy?
    user == comment.author
  end


  # def create?
    # refer to Photo Policy show action
  # end
end
