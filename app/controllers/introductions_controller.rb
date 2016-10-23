class IntroductionsController < ApplicationController
  def index
    @product = Product.new
    @product.product_images.build
  end

  def show
  end
end
