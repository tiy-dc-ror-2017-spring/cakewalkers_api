class ProductsController < ApplicationController
  before_action :set_product, only: %i(show update destroy)

  # GET /products
  def index
    @products = Product.all

    render json: @products
  end
end
