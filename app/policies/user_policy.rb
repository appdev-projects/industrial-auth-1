
class UserPolicy
  attr_reader :current_user, :user

  def feed?
    true
  end

  def initialize(current_user, user)
    @current_user = current_user
    @user = user
  end

  def show?
    user == current_user ||
     !user.private? || 
     user.followers.include?(current_user)
  end
  def liked?
    user.present?
  end
  def discover?
    user.present?
  end
  

end
