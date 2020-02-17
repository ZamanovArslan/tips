class ApplicationController < ActionController::Base
  include Authentication
  include Authorization
  include BulletHelper
  include CurrentCompany

  before_action :set_locale
  before_action :authorize_company!

  protect_from_forgery with: :exception

  responders :flash
  respond_to :html

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def authorize_company!
    if company_name
      raise ActionController::RoutingError, "Not Found" unless current_company
      authenticate_user!
      authorize current_company, :have_access?
    end
  end
end
