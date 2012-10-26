class SessionsController < ApplicationController
  def new
  end

  def create
    member = Member.find_by_name(params[:member])
    if member && member.authenticate(params[:password]) 
      session[:member_id] = params[:member_id]
      redirect_to root_url, :notice => "Logged in"
    else
      flash[:warning] = "Invalid member or password"
      render :new
    end
  end

  def destroy
    session[:member_id] = nil
    redirect_to root_url, :notice => "Logged out"
  end
end
