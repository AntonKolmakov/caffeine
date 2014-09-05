module Casein
  class AdminUserSessionsController < Casein::CaseinController
    skip_before_action :authorise, only: %i(new create)
    before_action :requires_no_session_user, except: :destroy

    layout 'casein/layouts/casein_auth'

    expose(:admin_user_session, model: 'Casein::AdminUserSession')

    def new
    end

    def create
      self.admin_user_session = Casein::AdminUserSession.new params[:casein_admin_user_session]
      if admin_user_session.save
        redirect_back_or_default controller: :casein, action: :index
      else
        render action: :new
      end
    end

    def destroy
      current_admin_user_session.destroy
      redirect_back_or_default new_casein_admin_user_session_url
    end

    private

    def requires_no_session_user
      return unless current_user
      redirect_to controller: :casein, action: :index
    end
  end
end
