require 'securerandom'

module Casein
  class AdminUsersController < AdminApplicationController
    before_action :needs_admin, except: %i(show destroy update update_password)
    before_action :needs_admin_or_current_user, only: %i(show destroy update update_password)

    expose(:users) { Casein::AdminUser.order(sort_order(:login)).paginate page: params[:page] }
    expose(:casein_admin_user, attributes: :casein_admin_user_params, model: 'Casein::AdminUser')

    def index
    end

    def new
      casein_admin_user.time_zone = Rails.configuration.time_zone
    end

    def show
      @casein_page_title = t('views.casein.admin_users.show.page_title')
    end

    def create
      generate_random_password if params[:generate_random_password]

      casein_admin_user.save
      respond_with(casein_admin_user)
    end

    def update
      casein_admin_user.save
      respond_with(casein_admin_user, action: :show, location: -> { casein_config_dashboard_url })
    end

    def update_password
      if casein_admin_user.valid_password? params[:form_current_password]
        save_admin(casein_admin_user_params)
      else
        flash[:warning] = t('views.casein.admin_users.update_password.messages.error.incorect_password')
      end

      redirect_to action: :show
    end

    def reset_password
      if passwords_blank?
        flash[:warning] = t('views.casein.admin_users.reset_password.messages.error.blank')
      else
        generate_random_password if params[:generate_random_password]
        unless casein_admin_user.id == @session_user.id && params[:generate_random_password].blank?
          casein_admin_user.notify_of_new_password = true
        end

        save_user(casein_admin_user_params)
      end

      redirect_to action: :show
    end

    def destroy
      user = Casein::AdminUser.find params[:id]
      return unless user.is_admin?
      respond_with(user, location: -> { casein_admin_users_path })
      user.destroy
    end

    private

    def generate_random_password
      random_password = SecureRandom.hex
      params[:casein_admin_user] = {} if params[:casein_admin_user].blank?
      params[:casein_admin_user].merge!(password: random_password, password_confirmation: random_password)
    end

    def interpolation_options
      { resource_name: casein_admin_user.email }
    end

    def save_user(casein_admin_user_params)
      if casein_admin_user.update_attributes casein_admin_user_params
        if !(casein_admin_user.notify_of_new_password)
          flash[:notice] = t('views.casein.admin_users.reset_password.messages.success.reset_password')
        else
          flash[:notice] = t('views.casein.admin_users.reset_password.messages.success.email_notification',
                             email: casein_admin_user.email)
        end
      else
        flash[:warning] = t('views.casein.admin_users.reset_password.messages.error.warning')
      end
    end

    def save_admin(casein_admin_user_params)
      if params[:casein_admin_user][:password].blank? && params[:casein_admin_user][:password_confirmation].blank?
        flash[:warning] = t('views.casein.admin_users.update_password.messages.error.blank')
      elsif casein_admin_user.update_attributes casein_admin_user_params
        flash[:notice] = t('views.casein.admin_users.update_password.messages.success.upadete_password')
      else
        flash[:warning] = t('views.casein.admin_users.update_password.messages.error.warning')
      end
    end

    private

    def casein_admin_user_params
      params.require(:casein_admin_user).permit(
          :login, :name, :email, :time_zone, :access_level, :password, :password_confirmation
      )
    end

    def passwords_blank?
      params[:generate_random_password].blank? &&
      casein_admin_user_params[:password].blank? &&
      casein_admin_user_params[:password_confirmation].blank?
    end
  end
end
