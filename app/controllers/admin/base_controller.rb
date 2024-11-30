module Admin
  class BaseController < ApplicationController
    before_action :require_admin

    private

    def require_admin
      unless current_user&.admin?
        redirect_to root_path, alert: "У вас немає доступу до цієї сторінки"
      end
    end
  end
end