class Diary < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :diary_comments

  validates :title, presence: true
  validates :text, presence: true

  def diary_profile_or_empty
    return 'no_image.png' if image.attached? == false

    image
  end

  def user_profile_or_empty
    return 'no_image2.png' if image.attached? == false

    image
  end
end
