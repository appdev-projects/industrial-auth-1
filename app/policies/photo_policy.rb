class PhotoPolicy 

  attr_reader :user, :photo

  def initialize(iser, photo)
    @user = user 
    @photo = photo
  end 

  def show? 
 #photo can only be seen by the owner or followers unless the owner is not private 
    user == photo.owner || !photo.owner.private? || photo.owner.followers.include?(user)
  end 

end 
