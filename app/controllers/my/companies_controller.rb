module My
  class CompaniesController < ApplicationController
    expose :company
    expose_decorated :companies, :fetch_companies

    def create
      CompanyMembership.create(user: current_user, company: company, role: :owner) if company.save
      render :index
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
      Company.where(id: current_user.company_memberships.owner(current_user).pluck(:id)).page(params[:page])
    end
  end
end
