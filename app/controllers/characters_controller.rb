class CharactersController < ApplicationController
  before_filter(:except => :index) { |a| a.send(:authorize,:admin) }
  # GET /characters
  # GET /characters.json
  def index
    @characters = Character.all
    @jobs = Job.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @characters }
    end
  end

  # GET /characters/1
  # GET /characters/1.json
  def show
    @character = Character.find(params[:id])
    @jobs = Job.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @character }
    end
  end

  # GET /characters/new
  # GET /characters/new.json
  def new
    @character = Character.new
    @members = Member.pluck(:name)
    @races = Race.pluck(:name)
    @jobs = Job.pluck(:name)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @character }
    end
  end

  # GET /characters/1/edit
  def edit
    @character = Character.find(params[:id])
    @members = Member.pluck(:name)
    @races = Race.pluck(:name)
    @jobs = Job.pluck(:name)
  end

  # POST /characters
  # POST /characters.json
  def create
    @character = Character.new(params[:character])
    member = Member.find_by_name(params[:member])
    @character.member = member
    @character.race = Race.find_by_name(params[:race]) unless params[:race].nil?
    @jobs = Job.all
    params[:jobs] ||= []
    @jobs.each do |j|
      if params[:jobs].include?(j.name)
        cj = @character.character_jobs.build
        cj.job = j
      else
        @character.character_jobs.where(:job == j).destroy_all
      end
    end

    respond_to do |format|
      if @character.save
        format.html { redirect_to @character, notice: 'Character was successfully created.' }
        format.json { render json: @character, status: :created, location: @character }
      else
        @members = Member.pluck(:name)
        @races = Race.pluck(:name)
        @jobs = Job.pluck(:name)
        format.html { render action: "new" }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /characters/1
  # PUT /characters/1.json
  def update
    @character = Character.find(params[:id])
    @character.race = Race.find_by_name(params[:race])
    @jobs = Job.all
    params[:jobs] ||= []
    @jobs.each do |j|
      if params[:jobs].include?(j.name)
        cj = @character.character_jobs.build
        cj.job = j
      else
        @character.character_jobs.where(:job == j).destroy_all
      end
    end

    respond_to do |format|
      if @character.update_attributes(params[:character])
        format.html { redirect_to @character, notice: 'Character was successfully updated.' }
        format.json { head :no_content }
      else
        @members = Member.pluck(:name)
        @races = Race.pluck(:name)
        @jobs = Job.pluck(:name)
        format.html { render action: "edit" }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /characters/1
  # DELETE /characters/1.json
  def destroy
    @character = Character.find(params[:id])
    @character.destroy

    respond_to do |format|
      format.html { redirect_to characters_url }
      format.json { head :no_content }
    end
  end
end
