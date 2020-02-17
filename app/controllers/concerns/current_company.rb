module CurrentCompany
  def current_company
    return @current_company if defined? @current_company

    @current_company = Company.find_by("lower(name) = ?", company_name)
  end

  def company_name
    company_name = request.subdomain
    company_name == "www" ? nil : company_name.presence
  end
end
