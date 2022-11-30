class UsersController < ApplicationController
before_action :authenticate_user!, only: [:mypage, :edit, :update]
before_action :set_user, only: [:show, :edit, :update]

  def mypage
    redirect_to user_path(current_user)
  end

  def show
    @diaries = @user.diaries.order('created_at DESC')
  end

  def edit
    unless @user == current_user
    redirect_to user_path(@user)
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end



  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
     params.require(:user).permit(:nickname, :age, :gender_id, :rank_id, :content, :image)
  end
end

