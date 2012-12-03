class MembersController < ApplicationController
  before_filter(:only => [:new, :create, :destroy]) { |a| a.send(:authorize,:admin) }
  before_filter :validate_member, :only => [:edit, :update]

  # GET /members
  # GET /members.json
  def index
    @members = Member.active

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @members }
    end
  end

  # GET /members/1
  # GET /members/1.json
  def show
    @member = Member.find(params[:id])
    @jobs = Job.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @member }
    end
  end

  # GET /members/new
  # GET /members/new.json
  def new
    @member = Member.new
    @member.characters.build
    @races = Race.all
    @selected_rewards = []
    @available_rewards = Reward.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @member }
    end
  end

  # GET /members/1/edit
  def edit
    @member = Member.find(params[:id])
    @races = Race.all
    @member.build_all_character_jobs
    @selected_rewards = @member.selected_rewards
    @available_rewards = @member.available_rewards
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(params[:member])
    @member.join_date = Time.now
    @member.reward_cycle = 1
    @member.cycle_date = Time.now
    @member.build_rewards(params[:reward_preferences].split(" "))

    respond_to do |format|
      if @member.save
        format.html { redirect_to @member, notice: 'Member was successfully created.' }
        format.json { render json: @member, status: :created, location: @member }
      else
        @races = Race.all
        @selected_rewards = []
        @available_rewards = Reward.all
	if @member.characters.count == 0
          @member.characters.build
	else
          @member.build_all_character_jobs
	end
        format.html { render action: "new" }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /members/1
  # PUT /members/1.json
  def update
    @member = Member.find(params[:id])
    @member.build_rewards(params[:reward_preferences].split(" "))

    respond_to do |format|
      if @member.update_attributes(params[:member])
        format.html { redirect_to @member, notice: 'Member was successfully updated.' }
        format.json { head :no_content }
      else
        @races = Race.all
        @member.build_all_character_jobs
        @selected_rewards = @member.selected_rewards
        @available_rewards = @member.available_rewards
        format.html { render action: "edit" }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member = Member.find(params[:id])
    @member.destroy

    respond_to do |format|
      format.html { redirect_to members_url }
      format.json { head :no_content }
    end
  end

  private

  def validate_member
    unless current_member.id == params[:id].to_i || admin?
      flash[:warning] = 'You may only edit yourself!'
      redirect_to :back
    end
  end
end
