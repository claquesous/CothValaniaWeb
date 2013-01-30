class SiteConfigsController < ApplicationController
  skip_before_filter :check_config_and_login, only: [:new, :create]
  before_filter(except: [:new, :create]) { |a| a.send(:authorize,:leader) }

  # GET /site_configs
  # GET /site_configs.json
  def index
    @site_configs = SiteConfig.page(params[:page])
    @new_leader_list = Member.admins - [Member.leader]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @site_configs }
    end
  end

  # GET /site_configs/1
  # GET /site_configs/1.json
  def show
    @site_config = SiteConfig.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @site_config }
    end
  end

  # GET /site_configs/new
  # GET /site_configs/new.json
  def new
    if SiteConfig.count != 0
      respond_to do |format|
        format.html { redirect_to site_configs_url, alert: "Site already configured." }
        format.json { head :no_content }
      end
    else
      @site_config = SiteConfig.new
      @member = Member.new
      @initial = true

      respond_to do |format|
        format.html { render :new, layout: 'logged_out' } # new.html.erb
        format.json { render json: @site_config }
      end
    end
  end

  # GET /site_configs/1/edit
  def edit
    @site_config = SiteConfig.find(params[:id])
  end

  # POST /site_configs
  # POST /site_configs.json
  def create
    if SiteConfig.count != 0
      respond_to do |format|
        format.html { redirect_to site_configs_url, alert: "Site already configured." }
        format.json { head :no_content }
      end
    else
      @site_config = SiteConfig.new(params[:site_config])
      @site_config.config_comment = "initial configuration"
      @member = Member.new(params[:member])
      @member.leader = true
      @member.admin = true
      @member.characters.build(name: params[:member][:name])

      result = SiteConfig.transaction do
        @member.save
        @site_config.save
      end

      respond_to do |format|
        if result
          session[:member_id] = @member.id if @member
          format.html { redirect_to root_url, notice: 'Your site has been configured.' }
          format.json { render json: @site_config, status: :created, location: @site_config }
        else
          format.html { render action: "new", layout: 'logged_out' }
          format.json { render json: @site_config.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PUT /site_configs/1
  # PUT /site_configs/1.json
  def update
    old_password = params[:site][:password] if params[:site]

    if authenticated = SiteConfig.last.authenticate(old_password)
      if params[:site_config][:password].blank? && params[:site_config][:password_confirmation].blank?
        # Use old password if none indicated
        params[:site_config][:password] = old_password
        params[:site_config][:password_confirmation] = old_password
      end
    end
      
    @site_config = SiteConfig.new(params[:site_config])
    @site_config.errors.add(:base, "Invalid site password") unless authenticated

    respond_to do |format|
      if authenticated && @site_config.save
        format.html { redirect_to site_configs_path, notice: 'Site config was successfully updated.' }
        format.json { head :no_content }
      else
        # Need to re-render with a valid model
        old_config = SiteConfig.find(params[:id])
        old_config.copy_attrs_and_errors(@site_config)
	@site_config = old_config
        format.html { render action: "edit" }
        format.json { render json: @site_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /site_configs/1
  # DELETE /site_configs/1.json
  def destroy
    @site_config = SiteConfig.find(params[:id])
    @site_config.destroy

    respond_to do |format|
      format.html { redirect_to site_configs_url }
      format.json { head :no_content }
    end
  end

  # PUT /update_leader
  def change_leader
    if new = Member.find(params[:member_id])
      old = Member.leader
      new.leader = true
      old.leader = nil

      Member.transaction do
        old.save
        new.save
      end

      respond_to do |format|
        format.html { redirect_to members_url, notice: "Site leader changed." }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to site_configs_url, alert: "No member found." }
        format.json { head :no_content }
      end
    end
  end

  private

end
