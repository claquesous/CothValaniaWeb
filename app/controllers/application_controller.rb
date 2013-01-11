class ApplicationController < ActionController::Base
  protect_from_forgery
  #force_ssl :except => "login"
  before_filter :check_config_and_login
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

  def event_list
    Event.visible.all
  end

  private
  def check_config_and_login
    require_login if check_config
  end

  def check_config
    @config = SiteConfig.last
    redirect_to new_site_config_path unless @config
    @config
  end

  def require_login
    redirect_to login_url unless current_member
  end

  def current_member
    @current_member ||= Member.find(session[:member_id]) if session[:member_id]
  end
  helper_method :current_member, :admin?, :leader?, :authorize, :event_list
end
