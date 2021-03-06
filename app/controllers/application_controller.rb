class ApplicationController < ActionController::Base
  protect_from_forgery

  #around_filter :scope_current_dealer_group

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

private

  def current_dealer_group
    #@current_dealer_group ||= DealerGroup.find_by_subdomain!(request.subdomain)
    #subdomain = request.subdomain
    #logger.info "subdomain: #{subdomain} (#{subdomain.class})"
    DealerGroup.new({ subdomain:"" })
  end
  helper_method :current_dealer_group

  def scope_current_dealer_group(&block)
    current_dealer_group.scope_schema("public", &block)
  end

end
