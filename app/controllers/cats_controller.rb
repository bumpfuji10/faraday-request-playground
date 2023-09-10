class CatsController < ApplicationController
  def index
    cat_service = CatApiService.new
    @cat_images = cat_service.multiple_cat_images(10)
  end
end
