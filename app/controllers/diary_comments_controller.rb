class DiaryCommentsController < ApplicationController
  def create
    @diary_comment = DiaryComment.new(diary_comment_params)
    if @diary_comment.save
      redirect_to diary_path(@diary_comment.diary)
    else
      @diary = @diary_comment.diary
      @diary_comments = @diary.diary_comments
      render 'diaries/show'
    end
  end

  def edit
    @diary = Diary.find(params[:diary_id])
    @diary_comment = DiaryComment.find(params[:id])
  end

  def update
    @diary = Diary.find(params[:diary_id])
    @diary_comment = DiaryComment.find(params[:id])
    if @diary_comment.update(diary_comment_params)
      redirect_to diary_path(@diary), notice: 'コメントを編集しました'
    else
      flash.now[:danger] = '編集に失敗しました'
      render 'edit'
    end
  end

  def destroy
    @diary_comment = DiaryComment.find(params[:id])
    @diary_comment.destroy
    flash[:danger] = 'コメントを削除しました'
    redirect_back(fallback_location: root_path)
  end

  private

  def diary_comment_params
    params.require(:diary_comment).permit(:diary_comment).merge(user_id: current_user.id, diary_id: params[:diary_id])
  end
end
