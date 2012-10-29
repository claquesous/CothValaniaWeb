class ApplicationController < ActionController::Base
  protect_from_forgery
  #force_ssl :except => "login"
  before_filter :require_login

  private

  def require_login
    redirect_to login_url unless current_member
  end

  def current_member
    @current_member ||= Member.find(session[:member_id]) if session[:member_id]
  end
  helper_method :current_member
end
