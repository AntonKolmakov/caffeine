module Admin
  class UsersController < Admin::ApplicationController
    before_action :require_admin

    expose(:users)
    expose(:user, attributes: :user_params)

    def index
    end

    def edit
    end

    def new
    end

    def create
      user.save
      respond_with :admin, user, location: -> { edit_admin_user_path(user) }
    end

    def update
      user.save
      sign_in(user, bypass: true)
      respond_with :admin, user, location: -> { edit_admin_user_path(user) }
    end

    def destroy
      user.destroy unless current_admin_user == user
      respond_with :admin, user, location: -> { admin_users_path }
    end

    private

    def user_params
      params.require(:user).permit(:full_name, :email, :password, :password_confirmation)
    end

    def require_admin
      redirect_to admin_root_path unless current_admin_user.admin?
    end
  end
end
