class RequirementObtainmentsController < ApplicationController
  before_filter(:except => :index) { |a| a.send(:authorize,:admin) }
  # GET /requirement_obtainments
  # GET /requirement_obtainments.json
  def index
    @requirement_obtainments = RequirementObtainment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @requirement_obtainments }
    end
  end

  # GET /requirement_obtainments/1
  # GET /requirement_obtainments/1.json
  def show
    @requirement_obtainment = RequirementObtainment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @requirement_obtainment }
    end
  end

  # GET /requirement_obtainments/new
  # GET /requirement_obtainments/new.json
  def new
    @requirement_obtainment = RequirementObtainment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @requirement_obtainment }
    end
  end

  # GET /requirement_obtainments/1/edit
  def edit
    @requirement_obtainment = RequirementObtainment.find(params[:id])
  end

  # POST /requirement_obtainments
  # POST /requirement_obtainments.json
  def create
    @requirement_obtainment = RequirementObtainment.new(params[:requirement_obtainment])

    respond_to do |format|
      if @requirement_obtainment.save
        format.html { redirect_to @requirement_obtainment, notice: 'Requirement obtainment was successfully created.' }
        format.json { render json: @requirement_obtainment, status: :created, location: @requirement_obtainment }
      else
        format.html { render action: "new" }
        format.json { render json: @requirement_obtainment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /requirement_obtainments/1
  # PUT /requirement_obtainments/1.json
  def update
    @requirement_obtainment = RequirementObtainment.find(params[:id])

    respond_to do |format|
      if @requirement_obtainment.update_attributes(params[:requirement_obtainment])
        format.html { redirect_to @requirement_obtainment, notice: 'Requirement obtainment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @requirement_obtainment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requirement_obtainments/1
  # DELETE /requirement_obtainments/1.json
  def destroy
    @requirement_obtainment = RequirementObtainment.find(params[:id])
    @requirement_obtainment.destroy

    respond_to do |format|
      format.html { redirect_to requirement_obtainments_url }
      format.json { head :no_content }
    end
  end
end
