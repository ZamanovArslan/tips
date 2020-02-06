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
end
