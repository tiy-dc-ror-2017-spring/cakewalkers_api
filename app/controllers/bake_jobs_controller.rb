class BakeJobsController < ApplicationController
  before_action :set_bake_job, only: [:show, :update, :destroy]

  # GET /bake_jobs
  def index
    @bake_jobs = BakeJob.all

    render json: @bake_jobs
  end

  # GET /bake_jobs/1
  def show
    render json: @bake_job
  end

  # POST /bake_jobs
  def create
    @bake_job = BakeJob.new(bake_job_params)

    if @bake_job.save
      render json: @bake_job, status: :created, location: @bake_job
    else
      render json: @bake_job.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bake_jobs/1
  def update
    if @bake_job.update(bake_job_params)
      render json: @bake_job
    else
      render json: @bake_job.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bake_jobs/1
  def destroy
    @bake_job.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bake_job
      @bake_job = BakeJob.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def bake_job_params
      params.require(:bake_job).permit(:product_id, :completed_at, :state)
    end
end
