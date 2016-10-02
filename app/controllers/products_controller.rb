class ProductsController < ApplicationController
  before_action :set_new_product
  before_action :set_product, only: [:show, :edit, :update]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def index
    @products = Product.order("created_at DESC")
  end

  def new
  end

  def show
    @lecture_comment = LectureComment.new
    # @lecture = Lecture.new
    # @lecture = @product.lecture
    @lecture = Lecture.find(@product.lecture.id)
    @product_comment = ProductComment.new
  end

  def edit
  end

  def update
    if @product.update(update_params)
      save_parents_instance
      flash[:notice] = "更新されました。"
      redirect_to :root
    else
      flash[:notice] = "更新されませんでした。しばらく時間を置いてからもう一度お試しください。"
      redirect_to :root
    end
  end

  def create
    @product = Product.new(create_params)
    if @product.save
      save_parents_instance
      flash[:notice] = "投稿完了しました。"
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
      :concept,
      :lecture_title,
      product_images_attributes: [:id, :image, :status]
      ).merge(user_id: current_user.id)
  end

  def update_params
    params.require(:product).permit(
      :title,
      :catchcopy,
      :concept,
      :lecture_title,
      product_images_attributes: [:id, :image, :status]
      ).merge(user_id: current_user.id)
  end

  def set_new_product
    @product = Product.new
    @product.product_images.build
  end

  def save_parents_instance
    college = College.where(college_name: current_user.college_name).first_or_create
    lecture = Lecture.where(lecture_title: params[:product][:lecture_title]).first_or_create
    lecture.college_id = college.id
    @product.college_id = college.id
    @product.lecture_id = lecture.id
    lecture.save
    @product.save
  end

  def set_product
    @product = Product.eager_load(:lecture, :college, :product_images).find(params[:id])
    @product_images = @product.product_images
  end

end
