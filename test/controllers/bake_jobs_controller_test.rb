require 'test_helper'

class BakeJobsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bake_job = bake_jobs(:one)
  end

  test "should get index" do
    get bake_jobs_url, as: :json
    assert_response :success
  end

  test "should create bake_job" do
    assert_difference('BakeJob.count') do
      post bake_jobs_url, params: { bake_job: { completed_at: @bake_job.completed_at, product_id: @bake_job.product_id, state: @bake_job.state } }, as: :json
    end

    assert_response 201
  end

  test "should show bake_job" do
    get bake_job_url(@bake_job), as: :json
    assert_response :success
  end

  test "should update bake_job" do
    patch bake_job_url(@bake_job), params: { bake_job: { completed_at: @bake_job.completed_at, product_id: @bake_job.product_id, state: @bake_job.state } }, as: :json
    assert_response 200
  end

  test "should destroy bake_job" do
    assert_difference('BakeJob.count', -1) do
      delete bake_job_url(@bake_job), as: :json
    end

    assert_response 204
  end
end
