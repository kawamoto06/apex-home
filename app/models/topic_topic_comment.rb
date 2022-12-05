class TopicTopicComment
  include ActiveModel::Model
  attr_accessor :name, :topic_comment, :user_id

  validates :name, presence: true
  validates :topic_comment, presence: true


end
