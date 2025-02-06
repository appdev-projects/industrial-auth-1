class CommentPolicy < ApplicationPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def show?
    @user == @comment.author
  end

  def new?
    show?
  end

  def edit?
    show?
  end

  def create?
    show?
  end

  def update?
    show?
  end

  def destroy?
    show?
  end
end
