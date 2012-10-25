class EventRewardsController < ApplicationController
  # GET /event_rewards
  # GET /event_rewards.json
  def index
    @event_rewards = EventReward.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @event_rewards }
    end
  end

  # GET /event_rewards/1
  # GET /event_rewards/1.json
  def show
    @event_reward = EventReward.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event_reward }
    end
  end

  # GET /event_rewards/new
  # GET /event_rewards/new.json
  def new
    @event_reward = EventReward.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event_reward }
    end
  end

  # GET /event_rewards/1/edit
  def edit
    @event_reward = EventReward.find(params[:id])
  end

  # POST /event_rewards
  # POST /event_rewards.json
  def create
    @event_reward = EventReward.new(params[:event_reward])

    respond_to do |format|
      if @event_reward.save
        format.html { redirect_to @event_reward, notice: 'Event reward was successfully created.' }
        format.json { render json: @event_reward, status: :created, location: @event_reward }
      else
        format.html { render action: "new" }
        format.json { render json: @event_reward.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /event_rewards/1
  # PUT /event_rewards/1.json
  def update
    @event_reward = EventReward.find(params[:id])

    respond_to do |format|
      if @event_reward.update_attributes(params[:event_reward])
        format.html { redirect_to @event_reward, notice: 'Event reward was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event_reward.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_rewards/1
  # DELETE /event_rewards/1.json
  def destroy
    @event_reward = EventReward.find(params[:id])
    @event_reward.destroy

    respond_to do |format|
      format.html { redirect_to event_rewards_url }
      format.json { head :no_content }
    end
  end
end
