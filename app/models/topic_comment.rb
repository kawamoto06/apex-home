class TopicComment < ApplicationRecord
  belongs_to :user
  belongs_to :topic

  validates :topic_comment, presence: true


 
end
