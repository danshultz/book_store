class Admin::ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :ensure_admin!

  def ensure_admin!
    render_not_found unless can(current_user, :access_admin)
  end


  def can(user, privilege)
    Appanage.can(user, privilege)
  end


  def render_not_found
    raise ActionController::RoutingError.new('Not Found')
  end

end
