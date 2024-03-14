class PhotoPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
    attr_reader :user, :photo

    def initialize(user, photo)
      @user = user
      @photo = photo
    end
  end
  

  def index?
    true
  end

  # Our policy is that a photo should only be seen by the owner or followers
  #   of the owner, unless the owner is not private in which case anyone can
  #   see it
  def show?
    user == record.owner ||
      !record.owner.private? ||
      record.owner.followers.include?(user)
  end

  def create?
    true
  end



  # step 11 here: to do add to notes
  # both update and destroy call on author? to 
  # check whether to allow that action based on if user is the owner of that account

  def update?
    author?
  end

  def destroy?
    author?
  end


  private
  def author?
    record.owner == user
    # step 12:
    # equivalent: photo.user == owner
    # owner because of belongs to relationship to user
    # fk_rails_...  (owner_id => users.id)
  end

end
