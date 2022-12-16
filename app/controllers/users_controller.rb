class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :edit, :update]
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.order(impressions_count: 'DESC')
  end

  def show
    impressionist(@user, nil, unique: [:ip_address])
    @diaries = @user.diaries.order('created_at DESC')
    @currentUserEntry = Entry.where(user_id: current_user.id)
    @userEntry = Entry.where(user_id: @user.id)
    return if @user.id == current_user.id

    @currentUserEntry.each do |cu|
      @userEntry.each do |u|
        if cu.room_id == u.room_id
          @isRoom = true
          @roomId = cu.room_id
        end
      end
    end
    if @isRoom
    else
      @room = Room.new
      @entry = Entry.new
    end
  end

  def edit
    redirect_to user_path(@user) unless @user == current_user
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
