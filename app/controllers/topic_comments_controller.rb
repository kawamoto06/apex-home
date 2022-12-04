class TopicCommentsController < ApplicationController
  def create
    @topic_comment = TopicComment.new(topic_comment_params)
    if @topic_comment.save
      
      redirect_to topic_path(@topic_comment.topic)
    else
      @topic = @topic_comment.topic
      @topic_comments = @topic.topic_comments
      render "topics/show" 
    end
  end
  
  def edit
    @topic = Topic.find(params[:topic_id])
    @topic_comment = TopicComment.find(params[:id])
  end

    




  private
  def topic_comment_params
    params.require(:topic_comment).permit(:topic_comment).merge(user_id: current_user.id, topic_id: params[:topic_id])
  end
end
