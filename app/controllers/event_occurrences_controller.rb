class EventOccurrencesController < ApplicationController
  before_filter(:except => :index) { |a| a.send(:authorize,:admin) }
  # GET /event_occurrences
  # GET /event_occurrences.json
  def index
    @event_occurrences = EventOccurrence.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @event_occurrences }
    end
  end

  # GET /event_occurrences/1
  # GET /event_occurrences/1.json
  def show
    @event_occurrence = EventOccurrence.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event_occurrence }
    end
  end

  # GET /event_occurrences/new
  # GET /event_occurrences/new.json
  def new
    @event_occurrence = EventOccurrence.new
    @events = Event.pluck(:name)
    @characters = Character.pluck(:name)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event_occurrence }
    end
  end

  # GET /event_occurrences/1/edit
  def edit
    @event_occurrence = EventOccurrence.find(params[:id])
    @events = Event.pluck(:name)
    @characters = Character.pluck(:name)
  end

  # POST /event_occurrences
  # POST /event_occurrences.json
  def create
    @event_occurrence = EventOccurrence.new(params[:event_occurrence])
    @event_occurrence.event = Event.find_by_name(params[:event])

    params[:character].each do |c,v|
      if v=="1"
        a = @event_occurrence.event_attendances.build
        a.character = Character.find_by_name(c)
      end
    end unless params[:character].nil?

    respond_to do |format|
      if @event_occurrence.save
        format.html { redirect_to @event_occurrence, notice: 'Event occurrence was successfully created.' }
        format.json { render json: @event_occurrence, status: :created, location: @event_occurrence }
      else
        @events = Event.pluck(:name)
        @characters = Character.pluck(:name)
        format.html { render action: "new" }
        format.json { render json: @event_occurrence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /event_occurrences/1
  # PUT /event_occurrences/1.json
  def update
    @event_occurrence = EventOccurrence.find(params[:id])

    respond_to do |format|
      if @event_occurrence.update_attributes(params[:event_occurrence])
        format.html { redirect_to @event_occurrence, notice: 'Event occurrence was successfully updated.' }
        format.json { head :no_content }
      else
        @events = Event.pluck(:name)
        @characters = Character.pluck(:name)
        format.html { render action: "edit" }
        format.json { render json: @event_occurrence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_occurrences/1
  # DELETE /event_occurrences/1.json
  def destroy
    @event_occurrence = EventOccurrence.find(params[:id])
    @event_occurrence.destroy

    respond_to do |format|
      format.html { redirect_to event_occurrences_url }
      format.json { head :no_content }
    end
  end
end
