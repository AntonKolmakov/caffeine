module Admin
  class UsersController < Admin::ApplicationController
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
      respond_with(:admin, user)
    end

    def update
      user.save
      respond_with(:admin, user)
    end

    def destroy
      user.destroy
      respond_with(:admin, user)
    end

    private

    def user_params
      params.require(:user).permit(:full_name, :email, :password)
    end
  end
end
