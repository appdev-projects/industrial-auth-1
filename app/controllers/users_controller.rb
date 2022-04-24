class UsersController < ApplicationController
  before_action :set_user, only: %i[ show liked feed followers following discover ]
  before_action :ensure_owner_is_current_user, only: %i[ feed discover ]


  private

    def set_user
      if params[:username]
        @user = User.find_by!(username: params.fetch(:username))
      else
        @user = current_user
      end
    end
end


def ensure_owner_is_current_user
  if params[:username] != current_user.username

    # redirect_to root_path, alert: "nice try, suckah"
    redirect_to user_path, alert: "nice try, suckah"
    
  end
end