class Diary < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :diary_comments

  validates :title, presence: true
  validates :text, presence: true

  def diary_profile_or_empty
    if self.image.attached? == false
    return "no_image.png"
    else
    return image
    end
  end
  def user_profile_or_empty
    if self.image.attached? == false
    return "no_image2.png"
    else
    return image
    end
  end
  
end
