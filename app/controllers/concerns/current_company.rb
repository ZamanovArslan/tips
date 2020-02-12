module CurrentCompany
  def current_company
    company_name = request.subdomain.presence || Company::DEFAULT_NAME
    @current_company = Company.find_by("lower(name) = ?", company_name)
    @current_company || (raise ActionController::RoutingError.new('Not Found'))
  end
end
