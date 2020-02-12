class ApplicationController < ActionController::Base
  include Authentication
  include Authorization
  include BulletHelper
  include CurrentCompany

  before_action :set_locale

  protect_from_forgery with: :exception

  responders :flash
  respond_to :html

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def current_account
    CompanyMembership.find_by(user: current_user, company: current_company)
  end
end
