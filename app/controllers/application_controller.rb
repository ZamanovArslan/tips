class ApplicationController < ActionController::Base
  include Authentication
  include Authorization
  include BulletHelper

  before_action :set_locale

  protect_from_forgery with: :exception

  responders :flash
  respond_to :html

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def current_company
    @current_company = Company.find_by("lower(name) = ?", request.subdomain)
    if @current_company || request.subdomain.empty?
      @current_company
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end
end
