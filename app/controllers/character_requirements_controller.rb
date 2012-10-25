class CharacterRequirementsController < ApplicationController
  # GET /character_requirements
  # GET /character_requirements.json
  def index
    @character_requirements = CharacterRequirement.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @character_requirements }
    end
  end

  # GET /character_requirements/1
  # GET /character_requirements/1.json
  def show
    @character_requirement = CharacterRequirement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @character_requirement }
    end
  end

  # GET /character_requirements/new
  # GET /character_requirements/new.json
  def new
    @character_requirement = CharacterRequirement.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @character_requirement }
    end
  end

  # GET /character_requirements/1/edit
  def edit
    @character_requirement = CharacterRequirement.find(params[:id])
  end

  # POST /character_requirements
  # POST /character_requirements.json
  def create
    @character_requirement = CharacterRequirement.new(params[:character_requirement])

    respond_to do |format|
      if @character_requirement.save
        format.html { redirect_to @character_requirement, notice: 'Character requirement was successfully created.' }
        format.json { render json: @character_requirement, status: :created, location: @character_requirement }
      else
        format.html { render action: "new" }
        format.json { render json: @character_requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /character_requirements/1
  # PUT /character_requirements/1.json
  def update
    @character_requirement = CharacterRequirement.find(params[:id])

    respond_to do |format|
      if @character_requirement.update_attributes(params[:character_requirement])
        format.html { redirect_to @character_requirement, notice: 'Character requirement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @character_requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /character_requirements/1
  # DELETE /character_requirements/1.json
  def destroy
    @character_requirement = CharacterRequirement.find(params[:id])
    @character_requirement.destroy

    respond_to do |format|
      format.html { redirect_to character_requirements_url }
      format.json { head :no_content }
    end
  end
end
