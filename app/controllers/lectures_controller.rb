class LecturesController < ApplicationController
  def show
    @lecture = Lecture.find(params[:id])
    @lecture_comments = LectureComment.where(lecture_id: @lecture.id).order("created_at DESC")
    @lecture_comment = LectureComment.new
    # @lecture_comment = @lecture.lecture_comments.create
    @product = Product.find_by(lecture_id: params[:id])
  end
end
