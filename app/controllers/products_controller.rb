class ProductsController < ApplicationController
  before_action :set_new_product
  def index
    @products = Product.order("created_at DESC")
  end

  def new
    # @product = Product.new
  end

  def show
    @product = Product.eager_load(:lecture, :college, :product_images).find(params[:id])
  end

  def create
    @product = Product.new(create_params)
    if @product.save
      create_parents_instance
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
      :concept,
      :college_name,
      :lecture_title,
      product_images_attributes: [:id, :image, :status]
      )
  end

  def set_new_product
    @product = Product.new
    @product.product_images.build
  end

  def create_parents_instance
    college = College.where(college_name: params[:product][:college_name]).first_or_create
    lecture = Lecture.where(lecture_title: params[:product][:lecture_title]).first_or_create
    @product.college_id = college.id
    @product.lecture_id = lecture.id
    @product.save
  end

end
