class SessionsController < ApplicationController
  layout 'logged_out'
  skip_before_filter :require_login

  def new
  end

  def create
    member = Member.find_by_name(params[:member])
    if member && member.authenticate(params[:password]) 
      session[:member_id] = member.id
      redirect_to root_url, :notice => "Logged in"
    else
      flash[:warning] = "Invalid member or password"
      render :new
    end
  end

  def destroy
    session[:member_id] = nil
    redirect_to login_url, :notice => "Logged out"
  end
end
