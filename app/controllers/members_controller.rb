class MembersController < ApplicationController
  before_filter(:only => [:destroy, :update_admins]) { |a| a.send(:authorize,:leader) }
  before_filter(:only => [:new, :create, :update_active]) { |a| a.send(:authorize,:admin) }
  before_filter :validate_member, :only => [:edit, :update, :begin_new_cycle]
  respond_to :html, :json

  def index
    if params[:update_active]
      @members = Member.all
      @update_active = true
    else
      @members = Member.active
      @members = @members.page(params[:page]) unless params[:update_admins]
      @update_admins =  params[:update_admins]
    end
    respond_with @members
  end

  def show
    @member = Member.find_by_name(CGI.unescape params[:id])
    @jobs = Job.all
    respond_with @member
  end

  def new
    @member = Member.new
    @member.characters.build
    @member.build_all_character_jobs
    @races = Race.all
    @rewards = Reward.all
    @available_rewards = Reward.all
    respond_with @member
  end

  def edit
    @member = Member.find_by_name(CGI.unescape params[:id])
    @races = Race.all
    @member.build_all_character_jobs
    @rewards = Reward.all
    @available_rewards = @member.available_rewards
  end

  def create
    @member = Member.new(params[:member])

    if @member.save
      flash[:notice] = "#{@config.members.singularize.capitalize} was successfully created."
    else
      @races = Race.all
      @rewards = Reward.all
      @available_rewards = Reward.all
      if @member.characters.length == 0
        @member.characters.build
      end
      @member.build_all_character_jobs
    end
    respond_with @member
  end

  def update
    @member = Member.find_by_name(CGI.unescape params[:id])

    if @member.update_attributes(params[:member])
      flash[:notice] = "#{@config.members.singularize.capitalize} was successfully updated."
    else
      @races = Race.all
      @member.build_all_character_jobs
      @rewards = Reward.all
      @available_rewards = @member.available_rewards
    end
    respond_with @member
  end

  def destroy
    @member = Member.find_by_name(CGI.unescape params[:id])
    @member.destroy
    respond_with @member
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
    redirect_to @member, notice: 'New Reward Cycle started.'
  end

  # GET /members/1/attendances
  # GET /members/1/attendances.json
  def attendances
    @member = Member.find_by_name(CGI.unescape params[:id])
    @attendances = @member.event_attendances.order_by_date.page(params[:page])

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
