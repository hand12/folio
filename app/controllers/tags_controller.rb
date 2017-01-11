class TagsController < ApplicationController
  before_action :set_new_product
  def index
    @tags = ActsAsTaggableOn::Tag.most_used
  end

  def show
    @tag = ActsAsTaggableOn::Tag.find(params[:id])
    @products = Product.tagged_with(@tag.name)
  end

  private
  def set_new_product
    @product = Product.new
    @product.product_images.build
  end
end
