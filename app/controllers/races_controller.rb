class RacesController < ApplicationController
  before_filter { |a| a.send(:authorize,:leader) }
  respond_to :html, :json

  def index
    @races = Race.page(params[:page])
    respond_with @races
  end

  def show
    @race = Race.find_by_name(CGI.unescape params[:id])
    respond_with @race
  end

  def new
    @race = Race.new
    respond_with @race
  end

  def edit
    @race = Race.find_by_name(CGI.unescape params[:id])
  end

  def create
    @race = Race.new(params[:race])
    flash[:notice] = "#{@config.races.singularize.capitalize} was successfully created." if @race.save
    respond_with @race
  end

  def update
    @race = Race.find_by_name(CGI.unescape params[:id])
    flash[:notice] = "#{@config.races.singularize.capitalize} was successfully updated." if @race.update_attributes(params[:race])
    respond_with @race
  end

  def destroy
    @race = Race.find_by_name(CGI.unescape params[:id])
    @race.destroy
    respond_with @race
  end
end
