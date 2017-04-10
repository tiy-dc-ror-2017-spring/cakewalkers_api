class WelcomeController < ApplicationController
  def index
    render json: {
      status: 404,
      documentation: "https://github.com/tiy-dc-ror-2017-spring/cakewalkers_api/blob/master/README.md",
      urls: {
        bake_jobs: bake_jobs_url,
        bake_jobs_in_oven: in_oven_bake_jobs_url,
        products: products_url
      }
    }
  end
end
