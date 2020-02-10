class CompaniesController < ApplicationController
  expose :company
  expose :tips, from: company

  def create

  end

  private

  def company_params
    params.require(:company).permit(:name).merge(owner: current_user)
  end
end
