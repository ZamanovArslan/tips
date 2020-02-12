module Users
  class RegistrationsController < Devise::RegistrationsController
    include CurrentCompany

    protected

    def update_resource(resource, params)
      resource.update_attributes(params)
    end

    def sign_up(resource_name, user)
      super(resource_name, user)
      CompanyMembership.create(user: user, company: current_company, role: :member)
    end

    def account_update_params
      params = devise_parameter_sanitizer.sanitize(:account_update)

      if passwords_blank?(params)
        params.except(:password, :password_confirmation)
      else
        params
      end
    end

    def passwords_blank?(params)
      params[:password].blank? && params[:password_confirmation].blank?
    end
  end
end
