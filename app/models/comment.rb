class Comment < ApplicationRecord
  belongs_to :topic
  belongs_to :topic_comment
end
