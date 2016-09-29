class ProductsController < ApplicationController
  def index
    @products = Product.order("created_at DESC")
    @product = Product.new
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

end
