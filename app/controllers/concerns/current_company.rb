module CurrentCompany
  def current_company
    company_name = request.subdomain

    return if company_name.blank?

    company = Company.find_by("lower(name) = ?", company_name)
    debugger
    company || (raise ActionController::RoutingError, "Not Found")
  end
end
