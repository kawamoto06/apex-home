class UsersController < ApplicationController
before_action :authenticate_user!, only: [:mypage, :edit, :update]
before_action :set_user, only: [:show, :edit, :update]

  def mypage
    redirect_to user_path(current_user)
  end

  def show
    @diaries = @user.diaries.order('created_at DESC')
    @current_entry = Entry.where(user_id: current_user.id)
    @another_entry = Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @current_entry.each do |current|
        @another_entry.each do |another|
          if current.room_id == another.room_id
            @is_room = true
            @room_id = current.room_id
          end
        end
      end
      unless @is_room
        @room = Room.new
        @entry = Entry.new
      end
    end
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

