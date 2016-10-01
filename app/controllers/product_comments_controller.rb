class ProductCommentsController < ApplicationController
  def create
    @product_comment = ProductComment.new(create_params)
    @product = Product.find(params[:product_comment][:product_id])
    if @product_comment.save
      flash[:notice] = "コメントを投稿しました。"
    else
      flash[:notice] = "コメントの投稿に失敗しました。しばらく時間を置いてからお試しください。"
    end
  end

  private
  def create_params
    params.require(:product_comment).permit(
      :content,
      :product_id
      )
  end
end
