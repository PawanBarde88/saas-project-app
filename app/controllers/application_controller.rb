class ApplicationController < ActionController::Base
    before_action :authenticate_user!
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  set_current_tenant_through_filter
  before_action :set_tenant
  before_action :configure_permitted_parameters, if: :devise_controller? 

  private

  def set_tenant
    if user_signed_in?
      set_current_tenant(current_user.account)
    end
  end

  # permit account_id param for Devise sign_up
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:account_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:account_id])

  end
end
