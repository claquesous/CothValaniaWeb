class ShoutsController < ApplicationController
  before_filter(only: [:destroy, :edit, :update]) { |a| a.send(:authorize,:admin) }
  respond_to :html, :json

  def index
    @shouts = Shout.includes(:member).page(params[:page])
    respond_with @shouts
  end

  def show
    @shout = Shout.find(params[:id])
    respond_with @shout
  end

  def new
    @shout = Shout.new
    respond_with @shout
  end

  def edit
    @shout = Shout.find(params[:id])
  end

  def create
    @shout = Shout.new(params[:shout])
    @shout.member = current_member
    flash[:notice] = 'Shout was successfully created.' if @shout.save
    respond_with @shout
  end

  def update
    @shout = Shout.find(params[:id])
    flash[:notice] = 'Shout was successfully updated.' if @shout.update_attributes(params[:shout])
    respond_with @shout
  end

  def destroy
    @shout = Shout.find(params[:id])
    @shout.destroy
    respond_with @shout
  end
end
