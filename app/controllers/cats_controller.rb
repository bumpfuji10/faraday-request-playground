class CatsController < ApplicationController
  def index
    cat_service = CatApiService.new
    @cat_image = cat_service.random_cat_image
  end
end
