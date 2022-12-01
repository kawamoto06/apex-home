class DiaryComment < ApplicationRecord
  belongs_to :user
  belongs_to :diary

  validates :diary_comment, presence: true
end
