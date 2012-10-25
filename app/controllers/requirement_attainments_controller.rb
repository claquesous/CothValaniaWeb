class RequirementAttainmentsController < ApplicationController
  # GET /requirement_attainments
  # GET /requirement_attainments.json
  def index
    @requirement_attainments = RequirementAttainment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @requirement_attainments }
    end
  end

  # GET /requirement_attainments/1
  # GET /requirement_attainments/1.json
  def show
    @requirement_attainment = RequirementAttainment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @requirement_attainment }
    end
  end

  # GET /requirement_attainments/new
  # GET /requirement_attainments/new.json
  def new
    @requirement_attainment = RequirementAttainment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @requirement_attainment }
    end
  end

  # GET /requirement_attainments/1/edit
  def edit
    @requirement_attainment = RequirementAttainment.find(params[:id])
  end

  # POST /requirement_attainments
  # POST /requirement_attainments.json
  def create
    @requirement_attainment = RequirementAttainment.new(params[:requirement_attainment])

    respond_to do |format|
      if @requirement_attainment.save
        format.html { redirect_to @requirement_attainment, notice: 'Requirement attainment was successfully created.' }
        format.json { render json: @requirement_attainment, status: :created, location: @requirement_attainment }
      else
        format.html { render action: "new" }
        format.json { render json: @requirement_attainment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /requirement_attainments/1
  # PUT /requirement_attainments/1.json
  def update
    @requirement_attainment = RequirementAttainment.find(params[:id])

    respond_to do |format|
      if @requirement_attainment.update_attributes(params[:requirement_attainment])
        format.html { redirect_to @requirement_attainment, notice: 'Requirement attainment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @requirement_attainment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requirement_attainments/1
  # DELETE /requirement_attainments/1.json
  def destroy
    @requirement_attainment = RequirementAttainment.find(params[:id])
    @requirement_attainment.destroy

    respond_to do |format|
      format.html { redirect_to requirement_attainments_url }
      format.json { head :no_content }
    end
  end
end
