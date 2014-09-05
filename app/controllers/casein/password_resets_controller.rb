module Casein
  class PasswordResetsController < Casein::CaseinController
    skip_before_filter :authorise
    before_filter :load_user_using_perishable_token, only: %i(edit update)

    layout 'casein_auth'

    def create
      users = Casein::AdminUser.where(email: params[:recover_email]).all

      if users.length > 0
        users.each do |user|
          user.send_password_reset_instructions
        end

        if users.length > 1
          flash[:notice] = t('controller.casein.password_resets.create.messages.notice')
        else
          flash[:notice] = t('controller.casein.password_resets.create.messages.success')
        end
      else
        flash[:warning] = t('controller.casein.password_resets.create.messages.warning')
      end

      redirect_to new_casein_admin_user_session_url
    end

    def edit
      render
    end

    def update

      if params[:casein_admin_user][:password].empty? || params[:casein_admin_user][:password_confirmation].empty?
        flash.now[:warning] = t('controller.casein.password_resets.update.messages.warning')
      else

        @reset_user.password = params[:casein_admin_user][:password]
        @reset_user.password_confirmation = params[:casein_admin_user][:password_confirmation]

        if @reset_user.save
          flash[:notice] = t('controller.casein.password_resets.update.messages.notice')
          redirect_to new_casein_admin_user_session_url
          return
        end
      end

      render action: :edit
    end

    private

    def load_user_using_perishable_token

      @reset_user = Casein::AdminUser.find_using_perishable_token params[:token]

      unless @reset_user
        flash[:warning] = t('controller.casein.admin_users.perishable_token.warning')
        redirect_to new_casein_admin_user_session_url
      end
    end
  end
end