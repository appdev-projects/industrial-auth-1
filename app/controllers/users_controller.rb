class UsersController < ApplicationController
  before_action :set_user, only: %i[ show liked feed followers following discover ]
  
  before_action :ensure_user_is_current_user, only: [:feed, :discover]

  def ensure_user_is_current_user
    if @user != current_user
      redirect_back fallback_location: root_path, alert: "Nice try"
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