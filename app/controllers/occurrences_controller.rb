class OccurrencesController < ApplicationController
  before_filter(except: [:index, :show]) { |a| a.send(:authorize,:admin) }
  respond_to :html, :json

  def index
    @event = Event.find_by_name(CGI.unescape params[:event_id])
    @occurrences = @event.occurrences.page(params[:page])
    respond_with @event, @occurrences
  end

  def show
    @event = Event.find_by_name(CGI.unescape params[:event_id])
    @occurrence = Occurrence.find(params[:id])
    respond_with @event, @occurrence
  end

  def new
    @event = Event.find_by_name(CGI.unescape params[:event_id])
    @occurrence = @event.occurrences.build
    @members = Member.active
    respond_with @event, @occurrence
  end

  def edit
    @event = Event.find_by_name(CGI.unescape params[:event_id])
    @occurrence = Occurrence.find(params[:id])
    @members = Member.where{(active == true) | (id.in my{@occurrence.characters.joins(:member).select("members.id")})}
  end

  def create
    @event = Event.find_by_name(CGI.unescape params[:event_id])
    @occurrence = @event.occurrences.build(params[:occurrence])
    @occurrence.member = current_member

    if @occurrence.save
      flash[:notice] = "#{@config.occurrences.singularize.capitalize} was successfully created."
      respond_with @event, @occurrence, location: event_occurrence_path(@event, @occurrence)
    else
      @members = Member.active
      respond_with @event, @occurrence
    end
  end

  def update
    @event = Event.find_by_name(CGI.unescape params[:event_id])
    @occurrence = Occurrence.find(params[:id])

    if @occurrence.update_attributes(params[:occurrence])
      flash[:notice] = "#{@config.occurrences.singularize.capitalize} was successfully updated."
      respond_with @event, @occurrence
    else
      @members = Member.where{(active == true) | (id.in my{@occurrence.characters.joins(:member).select("members.id")})}
      respond_to do |format|
        format.html { render action: "edit" }
        format.json { render json: @occurrence.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event = Event.find_by_name(CGI.unescape params[:event_id])
    @occurrence = Occurrence.find(params[:id])
    @occurrence.destroy
    respond_with @event, @occurrence
  end
end
