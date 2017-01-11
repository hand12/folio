class IntroductionsController < ApplicationController
  def index
    @product = Product.new
    @product.product_images.build
    @newest_product = Product.order("created_at DESC").limit(1).first
  end

  def show
  end
end
