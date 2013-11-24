class EventsController < ApplicationController
  before_filter(except: [:index, :show]) { |a| a.send(:authorize,:leader) }

  respond_to :html, :json

  def index
    if params[:update_visible]
      @events = Event.all
      @update_visible = true
    else
      @events = Event.visible.page(params[:page])
    end
    respond_with @events
  end

  def show
    @event = Event.find_by_name(CGI.unescape params[:id])
    respond_with @event
  end

  def new
    @event = Event.new
    respond_with @event
  end

  def edit
    @event = Event.find_by_name(CGI.unescape params[:id])
  end

  def create
    @event = Event.new(params[:event])
    flash[:notice] = "#{@config.events.singularize.capitalize} was successfully created." if @event.save
    respond_with @event
  end

  def update
    @event = Event.find_by_name(CGI.unescape params[:id])
    flash[:notice] = "#{@config.events.singularize.capitalize} was successfully updated." if @event.update_attributes(params[:event])
    respond_with @event
  end

  def destroy
    @event = Event.find_by_name(CGI.unescape params[:id])
    @event.destroy
    respond_with @event
  end

  def update_visible
    if params[:event_ids].empty?
      Event.update_all(hidden: true)
    else
      Event.where(id: params[:event_ids]).update_all(hidden: false)
      Event.where{id.not_in my{params[:event_ids]}}.update_all(hidden: true)
    end
    redirect_to events_path
  end
end
