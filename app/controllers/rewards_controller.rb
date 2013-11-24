class RewardsController < ApplicationController
  before_filter(except: [:index, :show]) { |a| a.send(:authorize,:leader) }
  respond_to :html, :json

  def index
    @rewards = Reward.page(params[:page])
    respond_with @rewards
  end

  def show
    @reward = Reward.find_by_name(CGI.unescape params[:id])
    respond_with @reward
  end

  def new
    @reward = Reward.new
    @events = Event.visible
    @reward.build_all_event_rewards(@events)
    respond_with @reward
  end

  def edit
    @reward = Reward.find_by_name(CGI.unescape params[:id])
    @events = Event.visible
    @reward.build_all_event_rewards(@events)
  end

  def create
    @reward = Reward.new(params[:reward])

    if @reward.save
      flash[:notice] = "#{@config.rewards.singularize.capitalize} was successfully created."
    else
      @events = Event.visible
      @reward.build_all_event_rewards(@events)
    end
    respond_with @reward
  end

  def update
    @reward = Reward.find_by_name(CGI.unescape params[:id])

    if @reward.update_attributes(params[:reward])
      flash[:notice] = "#{@config.rewards.singularize.capitalize} was successfully updated."
    else
      @events = Event.visible
      @reward.build_all_event_rewards(@events)
    end
    respond_with @reward
  end

  def destroy
    @reward = Reward.find_by_name(CGI.unescape params[:id])
    @reward.destroy
    respond_with @reward
  end
end
