class UsersController < ApplicationController
  before_action :set_user, only: %i[ show liked feed followers following discover ]

  def feed
    if current_user == @user
    else
      redirect_back fallback_location: root_url, notice: "That isn't your feed..."
    end
  end

  def discover
    if current_user == @user
    else
      redirect_back fallback_location: root_url, notice: "That isn't your discover page..."
    end
  end
  
  private

    def set_user
      if params[:username]
        @user = User.find_by!(username: params.fetch(:username))
      else
        @user = current_user
      end
    end

    

end