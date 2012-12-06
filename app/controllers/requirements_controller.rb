class RequirementsController < ApplicationController
  before_filter { |a| a.send(:authorize,:leader) }
  # GET /requirements
  # GET /requirements.json
  def index
    @requirements = Requirement.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @requirements }
    end
  end

  # GET /requirements/1
  # GET /requirements/1.json
  def show
    @requirement = Requirement.find_by_name(CGI.unescape params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @requirement }
    end
  end

  # GET /requirements/new
  # GET /requirements/new.json
  def new
    @requirement = Requirement.new
    @events = Event.all
    @requirement.build_all_event_requirements(@events)
    @requirement.build_all_requirement_obtainments(@events)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @requirement }
    end
  end

  # GET /requirements/1/edit
  def edit
    @requirement = Requirement.find_by_name(CGI.unescape params[:id])
    @events = Event.all
    @requirement.build_all_event_requirements(@events)
    @requirement.build_all_requirement_obtainments(@events)
  end

  # POST /requirements
  # POST /requirements.json
  def create
    @requirement = Requirement.new(params[:requirement])

    respond_to do |format|
      if @requirement.save
        format.html { redirect_to @requirement, notice: 'Requirement was successfully created.' }
        format.json { render json: @requirement, status: :created, location: @requirement }
      else
        @events = Event.all
        @requirement.build_all_event_requirements(@events)
        @requirement.build_all_requirement_obtainments(@events)
        format.html { render action: "new" }
        format.json { render json: @requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /requirements/1
  # PUT /requirements/1.json
  def update
    @requirement = Requirement.find_by_name(CGI.unescape params[:id])

    respond_to do |format|
      if @requirement.update_attributes(params[:requirement])
        format.html { redirect_to @requirement, notice: 'Requirement was successfully updated.' }
        format.json { head :no_content }
      else
        @events = Event.all
        @requirement.build_all_event_requirements(@events)
        @requirement.build_all_requirement_obtainments(@events)
        format.html { render action: "edit" }
        format.json { render json: @requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requirements/1
  # DELETE /requirements/1.json
  def destroy
    @requirement = Requirement.find_by_name(CGI.unescape params[:id])
    @requirement.destroy

    respond_to do |format|
      format.html { redirect_to requirements_url }
      format.json { head :no_content }
    end
  end
end
