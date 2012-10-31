class ApplicationController < ActionController::Base
  protect_from_forgery
  #force_ssl :except => "login"
  before_filter :require_login
  protected

  def authorize(role)
    unless eval("#{role.to_s}\?")
      flash[:warning] = "You don't have access to do that."
      redirect_to root_url
      false
    end
  end

  def leader?
    @current_member.leader
  end

  def admin?
    @current_member.admin || @current_member.leader
  end

  private

  def require_login
    redirect_to login_url unless current_member
  end

  def current_member
    @current_member ||= Member.find(session[:member_id]) if session[:member_id]
  end
  helper_method :current_member, :admin?, :leader?, :authorize
end
