class JobsController < ApplicationController
  before_filter { |a| a.send(:authorize,:leader) }
  respond_to :html, :json

  def index
    @jobs = Job.page(params[:page])
    respond_with @jobs
  end

  def show
    @job = Job.find_by_name(CGI.unescape params[:id])
    respond_with @job
  end

  def new
    @job = Job.new
    respond_with @job
  end

  def edit
    @job = Job.find_by_name(CGI.unescape params[:id])
  end

  def create
    @job = Job.new(params[:job])
    flash[:notice] = "#{@config.jobs.singularize.capitalize} was successfully created." if @job.save
    respond_with @job
  end

  def update
    @job = Job.find_by_name(CGI.unescape params[:id])
    flash[:notice] = "#{@config.jobs.singularize.capitalize} was successfully updated." if @job.update_attributes(params[:job])
    respond_with @job
  end

  def destroy
    @job = Job.find_by_name(CGI.unescape params[:id])
    @job.destroy
    respond_with @job
  end
end
