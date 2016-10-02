class LectureCommentsController < ApplicationController
  before_action :authenticate_user!, only: :create
  def create
    @lecture_comment = LectureComment.new(create_params)
    if @lecture_comment.save
      flash[:notice] = "投稿完了しました。"
      redirect_to controller: :lectures, action: :show, id: @lecture_comment.lecture.id
    else
      flash[:notice] = "送信できませんでした。しばらく時間を置いてから送信してください。"
      redirect_to :back
    end
  end

  private
  def create_params
    params.require(:lecture_comment).permit(
      :difficulty,
      :comment,
      :lecture_id).merge(user_id: current_user.id)
  end
end
