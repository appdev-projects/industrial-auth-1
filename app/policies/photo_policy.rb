
class PhotoPolicy
  attr_reader :user, :photo

  def initialize(user, photo)
    @user = user
    @photo = photo
  end

  def new?
    user.present?
  end

  def create?
    new?
  end
  
  def show?
    user.present?
  end
  
  def liked?
    user.present?
  end
end
