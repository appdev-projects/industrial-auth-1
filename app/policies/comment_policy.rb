# app/policies/comment_policy.rb

class CommentPolicy < ApplicationPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def show?
    user == comment.author || PhotoPolicy.new(user, comment.photo).show?
  end

  def create?
    true
  end

  def update?
    user == comment.author
  end

  def destroy?
    user == comment.author || user == comment.photo.owner
  end

end
