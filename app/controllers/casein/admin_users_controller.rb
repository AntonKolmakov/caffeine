require 'securerandom'

module Casein
  class AdminUsersController < AdminApplicationController
    before_action :needs_admin, except: [:show, :destroy, :update, :update_password]
    before_action :needs_admin_or_current_user, only: [:show, :destroy, :update, :update_password]

    expose(:users) { Casein::AdminUser.order(sort_order(:login)).paginate page: params[:page] }
    expose(:casein_admin_user, attributes: :casein_admin_user_params, model: 'Casein::AdminUser')

    def index
    end

    def new
      casein_admin_user.time_zone = Rails.configuration.time_zone
    end

    def show
      @casein_page_title = casein_admin_user.name + ' > View user'
    end

    def create
      generate_random_password if params[:generate_random_password]

      casein_admin_user.save
      respond_with(casein_admin_user)
    end

    def update
      @casein_page_title = casein_admin_user.name + ' > Update user'

      casein_admin_user.save
      respond_with(casein_admin_user, action: :show, location: -> { casein_config_dashboard_url })
    end

    def update_password
      @casein_page_title = casein_admin_user.name + ' > Update password'

      if casein_admin_user.valid_password? params[:form_current_password]
        if params[:casein_admin_user][:password].blank? && params[:casein_admin_user][:password_confirmation].blank?
          flash[:warning] = t('views.casein.admin_users.reset_password.errors.messages.blank')
        elsif casein_admin_user.update_attributes casein_admin_user_params
          flash[:notice] = 'Your password has been changed'
        else
          flash[:warning] = 'There were problems when trying to change your password'
        end
      else
        flash[:warning] = 'The current password is incorrect'
      end

      redirect_to action: :show
    end

    def reset_password
      @casein_page_title = casein_admin_user.name + ' > Reset password'

      if params[:generate_random_password].blank? && params[:casein_admin_user][:password].blank? && params[:casein_admin_user][:password_confirmation].blank?
        flash[:warning] = t('views.casein.admin_users.reset_password.errors.messages.blank')
      else
        generate_random_password if params[:generate_random_password]
        casein_admin_user.notify_of_new_password = true unless casein_admin_user.id == @session_user.id && params[:generate_random_password].blank?

        if casein_admin_user.update_attributes casein_admin_user_params
          unless casein_admin_user.notify_of_new_password
            flash[:notice] = t('views.casein.admin_users.reset_password.success.messages')
          else
            flash[:notice] = 'Password has been reset and ' + casein_admin_user.name + ' has been notified by email'
          end
        else
          flash[:warning] = "There were problems when trying to reset this user's password"
        end
      end

      redirect_to action: :show
    end

    def destroy
      user = Casein::AdminUser.find params[:id]
      if user.is_admin? == false || Casein::AdminUser.has_more_than_one_admin
        user.destroy
        flash[:notice] = user.name + ' has been deleted'
      end
      redirect_to casein_admin_users_path
    end

    private

    def generate_random_password
      random_password = random_string = SecureRandom.hex
      params[:casein_admin_user] = {} if params[:casein_admin_user].blank?
      params[:casein_admin_user].merge! ({ password: random_password, password_confirmation: random_password })
    end

    def casein_admin_user_params
      params.require(:casein_admin_user).permit(:login, :name, :email, :time_zone, :access_level, :password, :password_confirmation)
    end

    def interpolation_options
      { resource_name: casein_admin_user.email }
    end
  end
end
