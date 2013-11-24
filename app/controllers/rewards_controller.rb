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
    load_related
    respond_with @reward
  end

  def edit
    @reward = Reward.find_by_name(CGI.unescape params[:id])
    load_related
  end

  def create
    @reward = Reward.new(params[:reward])

    if @reward.save
      flash[:notice] = "#{@config.rewards.singularize.capitalize} was successfully created."
    else
      load_related
    end
    respond_with @reward
  end

  def update
    @reward = Reward.find_by_name(CGI.unescape params[:id])

    if @reward.update_attributes(params[:reward])
      flash[:notice] = "#{@config.rewards.singularize.capitalize} was successfully updated."
    else
      load_related
    end
    respond_with @reward
  end

  def destroy
    @reward = Reward.find_by_name(CGI.unescape params[:id])
    @reward.destroy
    respond_with @reward
  end

  private

  def load_related
    @events = Event.visible
    @reward.build_all_event_rewards(@events)
  end
end
