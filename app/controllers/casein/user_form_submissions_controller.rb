module Casein
  class UserFormSubmissionsController < Casein::CaseinController
    responders :flash, :collection
    respond_to :html

    expose(:user_form)
    expose(:user_form_submissions) do
      user_form.user_form_submissions.order(sort_order(:created_at)).paginate(page: params[:page])
    end

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
