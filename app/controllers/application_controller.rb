class ApplicationController < ActionController::Base
  protect_from_forgery
  force_ssl :except => "login"

  private

  def current_member
    @current_member ||= User.find(session[:member_id]) if session[:member_id]
  end
  helper_method :current_member
end
