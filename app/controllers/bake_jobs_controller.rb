class BakeJobsController < ApplicationController
  before_action :set_bake_job, only: [:show]
  before_action :update_states

  private def update_states
    BakeJob.update_all_states
  end

  private def current_page
    params[:page] ? params[:page].to_i - 1 : 0
  end

  # GET /bake_jobs
  def index
    @bake_jobs = BakeJob.limit(25).offset(current_page)
    render json: @bake_jobs
  end

  # GET /bake_jobs/in_oven
  def in_oven
    @bake_jobs = BakeJob \
      .where(state: :baking)
      .limit(25)
      .offset(current_page)

    render json: @bake_jobs
  end

  # GET /bake_jobs/1
  def show
    render json: @bake_job
  end

  # POST /bake_jobs
  def create
    @product = Product.find_by(code: params[:product_code])

    @bake_job = @product.bake_jobs.new(bake_job_params)

    if @bake_job.save
      render json: @bake_job, status: :created, location: @bake_job
    else
      render json: @bake_job.errors, status: :unprocessable_entity
    end
  end

  def flush_jobs
    BakeJob.update_all(state: :done)
    redirect_to bake_jobs_path
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bake_job
      @bake_job = BakeJob.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def bake_job_params
      params.require(:bake_job).permit(:quantity)
    end
end
