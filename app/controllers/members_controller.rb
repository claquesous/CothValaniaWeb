class MembersController < ApplicationController
  before_filter(:only => [:destroy, :update_admins]) { |a| a.send(:authorize,:leader) }
  before_filter(:only => [:new, :create, :update_active]) { |a| a.send(:authorize,:admin) }
  before_filter :validate_member, :only => [:edit, :update, :begin_new_cycle]

  # GET /members
  # GET /members.json
  def index
    if params[:update_active]
      @members = Member.all
      @update_active = true
    else
      @members = Member.active
      @update_admins =  params[:update_admins]
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @members }
    end
  end

  # GET /members/1
  # GET /members/1.json
  def show
    @member = Member.find_by_name(CGI.unescape params[:id])
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
    @member.build_all_character_jobs
    @races = Race.all
    @rewards = Reward.all
    @available_rewards = Reward.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @member }
    end
  end

  # GET /members/1/edit
  def edit
    @member = Member.find_by_name(CGI.unescape params[:id])
    @races = Race.all
    @member.build_all_character_jobs
    @rewards = Reward.all
    @available_rewards = @member.available_rewards
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(params[:member])

    respond_to do |format|
      if @member.save
        format.html { redirect_to @member, notice: 'Member was successfully created.' }
        format.json { render json: @member, status: :created, location: @member }
      else
        @races = Race.all
        @rewards = Reward.all
        @available_rewards = Reward.all
        if @member.characters.length == 0
          @member.characters.build
        end
        @member.build_all_character_jobs
        format.html { render action: "new" }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /members/1
  # PUT /members/1.json
  def update
    @member = Member.find_by_name(CGI.unescape params[:id])

    respond_to do |format|
      if @member.update_attributes(params[:member])
        format.html { redirect_to @member, notice: 'Member was successfully updated.' }
        format.json { head :no_content }
      else
        @races = Race.all
        @member.build_all_character_jobs
        @rewards = Reward.all
        @available_rewards = @member.available_rewards
        format.html { render action: "edit" }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member = Member.find_by_name(CGI.unescape params[:id])
    @member.destroy

    respond_to do |format|
      format.html { redirect_to members_url }
      format.json { head :no_content }
    end
  end

  def update_active
    Member.update_all(["active = id in (?)",params[:member_ids]])
    redirect_to members_path
  end

  def update_admins
    Member.update_all(["admin = id in (?)", params[:member_ids]])
    redirect_to members_path
  end

  # PUT /members/Name/begin_new_cycle
  def begin_new_cycle
    @member = Member.find_by_name(CGI.unescape params[:id])
    @member.begin_new_cycle
    flash[:notice] = 'New Reward Cycle started.'
    redirect_to @member
  end

  # GET /members/1/attendances
  # GET /members/1/attendances.json
  def attendances
    @member = Member.find_by_name(CGI.unescape params[:id])

    respond_to do |format|
      format.html # attendances.html.erb
      format.json { render json: @member.event_attendances }
    end
  end

  private

  def validate_member
    unless current_member.to_param == params[:id] || admin?
      flash[:warning] = 'You may only edit yourself!'
      redirect_to Member.find_by_name(CGI.unescape params[:id])
    end
  end
end
