class EventRequirementsController < ApplicationController
  # GET /event_requirements
  # GET /event_requirements.json
  def index
    @event_requirements = EventRequirement.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @event_requirements }
    end
  end

  # GET /event_requirements/1
  # GET /event_requirements/1.json
  def show
    @event_requirement = EventRequirement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event_requirement }
    end
  end

  # GET /event_requirements/new
  # GET /event_requirements/new.json
  def new
    @event_requirement = EventRequirement.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event_requirement }
    end
  end

  # GET /event_requirements/1/edit
  def edit
    @event_requirement = EventRequirement.find(params[:id])
  end

  # POST /event_requirements
  # POST /event_requirements.json
  def create
    @event_requirement = EventRequirement.new(params[:event_requirement])

    respond_to do |format|
      if @event_requirement.save
        format.html { redirect_to @event_requirement, notice: 'Event requirement was successfully created.' }
        format.json { render json: @event_requirement, status: :created, location: @event_requirement }
      else
        format.html { render action: "new" }
        format.json { render json: @event_requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /event_requirements/1
  # PUT /event_requirements/1.json
  def update
    @event_requirement = EventRequirement.find(params[:id])

    respond_to do |format|
      if @event_requirement.update_attributes(params[:event_requirement])
        format.html { redirect_to @event_requirement, notice: 'Event requirement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event_requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_requirements/1
  # DELETE /event_requirements/1.json
  def destroy
    @event_requirement = EventRequirement.find(params[:id])
    @event_requirement.destroy

    respond_to do |format|
      format.html { redirect_to event_requirements_url }
      format.json { head :no_content }
    end
  end
end
