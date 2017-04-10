class WelcomeController < ApplicationController
  def index
    render json: {
      status: 404,
      documentation: "https://github.com/tiy-dc-ror-2017-spring/cakewalkers_api/blob/master/README.md"
    }
  end
end
