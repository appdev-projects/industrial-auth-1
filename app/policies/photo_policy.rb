class PhotoPolicy
  attr_reader :user, :photo

  def initialize(user, photo)
    @user = user
    @photo = photo
  end

  def show?
    user == photo.owner ||
      !photo.owner.private? ||
      photo.owner.followers.include?(user)
  end

  def new?
    create?
  end

  def edit?
    update?
  end

  def create?
    true
  end

  def update?
    user == photo.owner
  end

  def destroy?
    user == photo.owner
  end
end
