class UsersController < ApplicationController
  before_action :set_new_product
  before_action :authenticate_user!, only: :update
  def show
    @product = Product.new
    @product.product_images.build
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    if current_user.update(update_params)
      flash[:notice] = "登録情報を更新しました。"
      redirect_to controller: :users, action: :show, id: current_user.id
    else
      flash[:notiec] = "更新に失敗しました。しばらく時間を置いてからもう一度お試しください。"
    end
  end

  private
  def set_new_product
    @product = Product.new
    @product.product_images.build
  end

  def update_params
    params.require(:user).permit(
      :name,
      :college_name,
      :profile,
      :avatar)
  end
end
