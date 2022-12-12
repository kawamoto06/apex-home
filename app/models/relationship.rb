class Relationship < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :followed, class_name: 'User'

  def user_profile_or_empty
    return 'no_image2.png' if image.attached? == false

    image
  end
end
