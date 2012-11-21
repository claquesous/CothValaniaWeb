class OccurrencesController < ApplicationController
  before_filter(:except => :index) { |a| a.send(:authorize,:admin) }
  # GET /occurrences
  # GET /occurrences.json
  def index
    @event = Event.find(params[:event_id])
    @occurrences = @event.occurrences

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @occurrences }
    end
  end

  # GET /occurrences/1
  # GET /occurrences/1.json
  def show
    @event = Event.find(params[:event_id])
    @occurrence = Occurrence.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @occurrence }
    end
  end

  # GET /occurrences/new
  # GET /occurrences/new.json
  def new
    @event = Event.find(params[:event_id])
    @occurrence = @event.occurrences.build
    @members = Member.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @occurrence }
    end
  end

  # GET /occurrences/1/edit
  def edit
    @event = Event.find(params[:event_id])
    @occurrence = Occurrence.find(params[:id])
    @members = Member.all
  end

  # POST /occurrences
  # POST /occurrences.json
  def create
    @event = Event.find(params[:event_id])
    @occurrence = @event.occurrences.build(params[:occurrence])

    used_requirements = []
    used_requirements = CharacterRequirement.find(params[:character_requirement_id]) if params[:character_requirement_id]
    @occurrence.used_requirements = used_requirements

    respond_to do |format|
      if @occurrence.save
        format.html { redirect_to event_occurrence_url(@event,@occurrence), notice: 'Event occurrence was successfully created.' }
        format.json { render json: @occurrence, status: :created, location: @occurrence }
      else
        @members = Member.all
        format.html { render action: "new" }
        format.json { render json: @occurrence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /occurrences/1
  # PUT /occurrences/1.json
  def update
    @event = Event.find(params[:event_id])
    @occurrence = Occurrence.find(params[:id])

    used_requirements = []
    used_requirements = CharacterRequirement.find(params[:character_requirement_id]) if params[:character_requirement_id]
    @occurrence.used_requirements = used_requirements

    respond_to do |format|
      if @occurrence.update_attributes(params[:occurrence])
        format.html { redirect_to event_occurrence_url(@event), notice: 'Event occurrence was successfully updated.' }
        format.json { head :no_content }
      else
        @members = Member.all
        format.html { render action: "edit" }
        format.json { render json: @occurrence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /occurrences/1
  # DELETE /occurrences/1.json
  def destroy
    @event = Event.find(params[:event_id])
    @occurrence = Occurrence.find(params[:id])
    @occurrence.destroy

    respond_to do |format|
      format.html { redirect_to event_occurrences_url(@event) }
      format.json { head :no_content }
    end
  end
end