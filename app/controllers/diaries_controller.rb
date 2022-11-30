class DiariesController < ApplicationController
  before_action :move_to_signed_in, except: [:index, :show]
  before_action :ensure_user, only: [:edit]
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

  def show
    @diary = Diary.find(params[:id])
  end

  def edit
    @diary = Diary.find(params[:id])
  end

  def update
    @diary = Diary.find(params[:id])
    if @diary.update(diary_params)
      redirect_to diary_path(@diary.id)
    else
      render :edit
    end
  end

  def destroy
    diary = Diary.find(params[:id])
    diary.destroy
    redirect_to root_path
  end


  private

  def move_to_signed_in
    return if user_signed_in?

    redirect_to '/users/sign_in'
  end

  def diary_params
    params.require(:diary).permit(:image, :title, :text ).merge(user_id: current_user.id,)
  end

  def ensure_user
    @diaries = current_user.diaries
    @diary = @diaries.find_by(id: params[:id])
    redirect_to root_path unless @diary
  end
end
