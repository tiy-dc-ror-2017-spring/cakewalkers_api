require "test_helper"

class BakeJobsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bake_job = bake_jobs(:one)
  end

  test "should get index" do
    get bake_jobs_url, as: :json
    assert_response :success
  end

  test "should create bake_job" do
    assert_difference("BakeJob.count") do
      post product_bake_jobs_path(Product.last.code), params: { bake_job: { quantity: rand(5) } }, as: :json
    end

    assert_response 201
  end

  test "should show bake_job" do
    get bake_job_url(@bake_job), as: :json
    assert_response :success
  end
end
