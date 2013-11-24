class RequirementsController < ApplicationController
  before_filter(except: [:index, :show]) { |a| a.send(:authorize,:leader) }
  respond_to :html, :json

  def index
    @requirements = Requirement.page(params[:page])
    respond_with @requirements
  end

  def show
    @requirement = Requirement.find_by_name(CGI.unescape params[:id])
    respond_with @requirement
  end

  def new
    @requirement = Requirement.new
    load_related
    respond_with @requirement
  end

  def edit
    @requirement = Requirement.find_by_name(CGI.unescape params[:id])
    load_related
  end

  def create
    @requirement = Requirement.new(params[:requirement])

    if @requirement.save
      flash[:notice] = "#{@config.requirements.singularize.capitalize} was successfully created."
    else
      load_related
    end
    respond_with @requirement
  end

  def update
    @requirement = Requirement.find_by_name(CGI.unescape params[:id])

    if @requirement.update_attributes(params[:requirement])
      flash[:notice] = "#{@config.requirements.singularize.capitalize} was successfully updated."
    else
      load_related
    end
    respond_with @requirement
  end

  def destroy
    @requirement = Requirement.find_by_name(CGI.unescape params[:id])
    @requirement.destroy
    respond_with @requirement
  end

  private

  def load_related
    @events = Event.all
    @requirement.build_all_event_requirements(@events)
    @requirement.build_all_requirement_obtainments(@events)
  end
end
