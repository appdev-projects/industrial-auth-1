class CommentPolicy < ApplicationPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

    def index?
      true
    end
  
    def show?
      user == comment.author
    end
  
    def create?
      true
    end
  
  
    def update?
      author?
    end
  
  
    def destroy?
      author?
    end

    private
    def author?
      comment.author == user
    end
  
  
end
