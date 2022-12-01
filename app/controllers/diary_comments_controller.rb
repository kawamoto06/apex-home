class DiaryCommentsController < ApplicationController
  def create
    @diary_comment = DiaryComment.new(diary_comment_params)
    if @diary_comment.save
      redirect_to diary_path(@diary_comment.diary)
    else
      @diary = @diary_comment.diary
      @diary_comments = @diary.diary_comments
      render "diaries/show" 
    end


  end

  private
  def diary_comment_params
    params.require(:diary_comment).permit(:diary_comment).merge(user_id: current_user.id, diary_id: params[:diary_id])
  end
end
