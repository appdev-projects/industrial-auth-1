class PhotoPolicy < ApplicationPolicy
  attr_reader :user, :photo
  
  def initialize(user,photo)
    @user = user
    @photo = photo
  end

  def new?
    create?
  end

  def create?
    !user.nil?
  end

  def index?
    true
  end

  def show?
    user == photo.owner ||
     !photo.owner.private? ||
     photo.owner.followers.include?(user)
  end

  def destroy?
    user == photo.owner
  end

  def update?
    user == photo.owner
  end

  def edit?
      update?
  end

  class Scope < Scope
    def resolve
      scope.where(owner: user)
    end
  end

end
