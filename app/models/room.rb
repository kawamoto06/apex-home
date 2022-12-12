class Room < ApplicationRecord
  has_many :entries, dependent: :destroy
  has_many :users, through: :entries
  has_many :messages, dependent: :destroy

  def user_profile_or_empty
    return 'no_image2.png' if image.attached? == false

    image
  end
end
