class ProductsController < ApplicationController
  before_action :set_new_product
  def index
    @products = Product.order("created_at DESC")
  end

  def new
    # @product = Product.new
  end

  def show
  end

  def create
    @product = Product.new(create_params)
    if @product.save
      flash[:notice] = "投稿完了しました"
      redirect_to :root
    else
      flash[:notice] = "送信できませんでした。しばらく時間を置いてからもう一度お試し下さい。"
      redirect_to :root
    end
  end

  private
  def create_params
    params.require(:product).permit(
      :title,
      :catchcopy,
      :concept
      )
  end

  def set_new_product
    @product = Product.new
  end

end
