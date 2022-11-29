class DiariesController < ApplicationController
  before_action :move_to_signed_in, except: [:index, :show]
  def index
    @diaries = Diary.order('created_at DESC')
  end
  def new
    @diary = Diary.new
  end

  def create
    @diary = Diary.new(diary_params)
    if @diary.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def move_to_signed_in
    return if user_signed_in?

    redirect_to '/users/sign_in'
  end

  def diary_params
    params.require(:diary).permit(:image, :title, :text ).merge(user_id: current_user.id,)
  end
end
