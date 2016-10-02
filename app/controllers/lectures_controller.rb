class LecturesController < ApplicationController
  before_action :set_lecture, only: [:show, :update, :edit]
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  def show
    @lecture_comments = LectureComment.where(lecture_id: @lecture.id).order("created_at DESC")
    @lecture_comment = LectureComment.new
    # @lecture_comment = @lecture.lecture_comments.create
    @product = Product.new
    @product.product_images.build
  end

  def edit
  end

  def update
    if @lecture.update(update_params)
      flash[:notice] = "大学の情報を更新しました。"
      redirect_to :root
    else
      flash[:notice] = "保存することができませんでした。しばらく時間を置いてからもう一度お試しください。"
      redirect_to :root
    end
  end

  def destroy
  end

  private
  def update_params
    params.require(:lecture).permit(
      :teacher,
      :content
      ).merge(user_id: current_user.id)
  end

  def set_lecture
    @lecture = Lecture.find(params[:id])
  end
end
