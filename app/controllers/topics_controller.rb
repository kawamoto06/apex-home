class TopicsController < ApplicationController
  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @topic = Topic.find(params[:id])
    @topic_comment = TopicComment.new
    @topic_comments = @topic.topic_comments.includes(:user)
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update(topic_params)
      redirect_to topic_path(@topic.id)
    else
      render :edit
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:name).merge(user_id: current_user.id,)
  end
end
