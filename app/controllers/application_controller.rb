class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  add_flash_types :success, :danger
  before_action :require_login

  private

    def not_authenticated
      redirect_to login_path, danger: 'Please login first'
    end
end
