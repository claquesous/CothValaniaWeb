class RewardsController < ApplicationController
  before_filter(except: [:index, :show]) { |a| a.send(:authorize,:leader) }
  # GET /rewards
  # GET /rewards.json
  def index
    @rewards = Reward.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rewards }
    end
  end

  # GET /rewards/1
  # GET /rewards/1.json
  def show
    @reward = Reward.find_by_name(CGI.unescape params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reward }
    end
  end

  # GET /rewards/new
  # GET /rewards/new.json
  def new
    @reward = Reward.new
    @events = Event.visible
    @reward.build_all_event_rewards(@events)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reward }
    end
  end

  # GET /rewards/1/edit
  def edit
    @reward = Reward.find_by_name(CGI.unescape params[:id])
    @events = Event.visible
    @reward.build_all_event_rewards(@events)
  end

  # POST /rewards
  # POST /rewards.json
  def create
    @reward = Reward.new(params[:reward])

    respond_to do |format|
      if @reward.save
        format.html { redirect_to @reward, notice: 'Reward was successfully created.' }
        format.json { render json: @reward, status: :created, location: @reward }
      else
        @events = Event.visible
        @reward.build_all_event_rewards(@events)
        format.html { render action: "new" }
        format.json { render json: @reward.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rewards/1
  # PUT /rewards/1.json
  def update
    @reward = Reward.find_by_name(CGI.unescape params[:id])

    respond_to do |format|
      if @reward.update_attributes(params[:reward])
        format.html { redirect_to @reward, notice: 'Reward was successfully updated.' }
        format.json { head :no_content }
      else
        @events = Event.visible
        @reward.build_all_event_rewards(@events)
        format.html { render action: "edit" }
        format.json { render json: @reward.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rewards/1
  # DELETE /rewards/1.json
  def destroy
    @reward = Reward.find_by_name(CGI.unescape params[:id])
    @reward.destroy

    respond_to do |format|
      format.html { redirect_to rewards_url }
      format.json { head :no_content }
    end
  end
end
