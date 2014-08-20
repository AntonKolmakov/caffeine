module Casein
  class UserFormSubmissionsController < Casein::CaseinController
    responders :flash, :collection
    respond_to :html

    expose(:user_form_submissions) { UserFormSubmission.order(sort_order(:created_at)).paginate(page: params[:page]) }
    expose(:user_form)

    def index
      @casein_page_title = 'User form submissions'
    end

    def destroy
      user_form.destroy
      respond_with(:casein, user_form)
    end

    def show
    end
  end
end
