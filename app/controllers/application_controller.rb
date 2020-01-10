class ApplicationController < ActionController::Base
  include Authentication
  include Authorization
  include BulletHelper

  protect_from_forgery with: :exception

  responders :flash
  respond_to :html

  def default_url_options
    { locale: I18n.locale }
  end
end
