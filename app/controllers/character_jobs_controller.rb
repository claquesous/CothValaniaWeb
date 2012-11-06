class CharacterJobsController < ApplicationController
  # GET /character_jobs
  # GET /character_jobs.json
  def index
    @character_jobs = CharacterJob.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @character_jobs }
    end
  end

  # GET /character_jobs/1
  # GET /character_jobs/1.json
  def show
    @character_job = CharacterJob.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @character_job }
    end
  end

  # GET /character_jobs/new
  # GET /character_jobs/new.json
  def new
    @character_job = CharacterJob.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @character_job }
    end
  end

  # GET /character_jobs/1/edit
  def edit
    @character_job = CharacterJob.find(params[:id])
  end

  # POST /character_jobs
  # POST /character_jobs.json
  def create
    @character_job = CharacterJob.new(params[:character_job])

    respond_to do |format|
      if @character_job.save
        format.html { redirect_to @character_job, notice: 'Character job was successfully created.' }
        format.json { render json: @character_job, status: :created, location: @character_job }
      else
        format.html { render action: "new" }
        format.json { render json: @character_job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /character_jobs/1
  # PUT /character_jobs/1.json
  def update
    @character_job = CharacterJob.find(params[:id])

    respond_to do |format|
      if @character_job.update_attributes(params[:character_job])
        format.html { redirect_to @character_job, notice: 'Character job was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @character_job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /character_jobs/1
  # DELETE /character_jobs/1.json
  def destroy
    @character_job = CharacterJob.find(params[:id])
    @character_job.destroy

    respond_to do |format|
      format.html { redirect_to character_jobs_url }
      format.json { head :no_content }
    end
  end
end
