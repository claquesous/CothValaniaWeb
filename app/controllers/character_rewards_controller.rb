class CharacterRewardsController < ApplicationController
  # GET /character_rewards
  # GET /character_rewards.json
  def index
    @character_rewards = CharacterReward.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @character_rewards }
    end
  end

  # GET /character_rewards/1
  # GET /character_rewards/1.json
  def show
    @character_reward = CharacterReward.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @character_reward }
    end
  end

  # GET /character_rewards/new
  # GET /character_rewards/new.json
  def new
    @character_reward = CharacterReward.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @character_reward }
    end
  end

  # GET /character_rewards/1/edit
  def edit
    @character_reward = CharacterReward.find(params[:id])
  end

  # POST /character_rewards
  # POST /character_rewards.json
  def create
    @character_reward = CharacterReward.new(params[:character_reward])

    respond_to do |format|
      if @character_reward.save
        format.html { redirect_to @character_reward, notice: 'Character reward was successfully created.' }
        format.json { render json: @character_reward, status: :created, location: @character_reward }
      else
        format.html { render action: "new" }
        format.json { render json: @character_reward.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /character_rewards/1
  # PUT /character_rewards/1.json
  def update
    @character_reward = CharacterReward.find(params[:id])

    respond_to do |format|
      if @character_reward.update_attributes(params[:character_reward])
        format.html { redirect_to @character_reward, notice: 'Character reward was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @character_reward.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /character_rewards/1
  # DELETE /character_rewards/1.json
  def destroy
    @character_reward = CharacterReward.find(params[:id])
    @character_reward.destroy

    respond_to do |format|
      format.html { redirect_to character_rewards_url }
      format.json { head :no_content }
    end
  end
end
