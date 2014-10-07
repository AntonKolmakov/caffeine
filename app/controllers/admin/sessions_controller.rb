module Admin
  class SessionsController < ::Devise::SessionsController
    layout 'admin/layouts/login'
  end
end
