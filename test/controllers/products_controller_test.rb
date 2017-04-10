require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:cake)
  end

  test "should get index" do
    get products_url, as: :json
    assert_response :success
  end
end
