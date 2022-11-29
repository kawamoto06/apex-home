class UsersController < ApplicationController
before_action :authenticate_user!, only: [:mypage, :edit, :update]
before_action :set_user, only: [:show, :edit, :update]

  def mypage
    redirect_to user_path(current_user)
  end

  def show
  end

  def edit
      # 編集するユーザーが本人じゃない場合はユーザーページにリダイレクトする
      # これをしないと、ログインさえしていれば、"/users/5/edit"みたいな適当なurlにアクセスすると、他の人のプロフィール編集画面を表示できてしまう
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
     params.require(:user).permit(:nickname, :age, :gender_id, :rank_id, :content)
  end
end

