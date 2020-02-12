module My
  class CompaniesController < ApplicationController
    before_action :authenticate_user!

    expose :company
    expose_decorated :companies, :fetch_companies

    def create
      if company.save
        CompanyMembership.create(user: current_user, company: company, role: :owner)
        redirect_to my_companies_path, company: company
      else
        render :index
      end
    end

    def destroy
      company.destroy
      redirect_back(fallback_location: my_companies_path)
    end

    private

    def company_params
      params.require(:company).permit(:name)
    end

    def fetch_companies
      current_user.owned_companies.page(params[:page])
    end
  end
end
