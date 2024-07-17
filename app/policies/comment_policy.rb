class CommentPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def show?
    user == comment.author
  end

  def new?
    create?
  end

  def edit?
    update?
  end

  def create?
    user == comment.author ||
      !comment.author.private? ||
      comment.author.followers.include?(user)
  end

  def update?
    user == comment.author
  end

  def destroy?
    user == comment.author
  end
end
