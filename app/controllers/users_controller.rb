class UsersController < ApplicationController
  before_action :set_user, only: %i[ show liked feed followers following discover ]
  before_action :user_validation, only: %i[feed discover liked]

  private

    def set_user
      if params[:username]
        @user = User.find_by!(username: params.fetch(:username))
      else
        @user = current_user
      end
    end

    def user_validation
      if @user != current_user
        redirect_back fallback_location: root_path, alert: "Nice try"
      end
    end 
end