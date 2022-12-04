class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  def user_profile_or_empty
    if self.image.attached? == false
    return "no_image2.png"
    else
    return image
    end
  end
end
