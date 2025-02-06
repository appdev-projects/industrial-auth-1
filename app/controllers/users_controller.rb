class UsersController < ApplicationController
  before_action :set_user, only: %i[ show liked feed followers following discover ]
  
  def show
  end
  def liked
  end
  def feed
  end
  def followers 
  end
  def following
  end
  def discover 
  end

  private

    def set_user
      if params[:username]
        @user = User.find_by!(username: params.fetch(:username))
        authorize @user 
      else
        @user = current_user
        authorize @user 
      end
    end
end
