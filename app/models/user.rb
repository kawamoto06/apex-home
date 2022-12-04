class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :rank
  belongs_to :gender
  has_one_attached :image
  has_many :diaries
  has_many :topics

  validates :nickname, presence: true

  def user_profile_or_empty
    if self.image.attached? == false
    return "no_image2.png"
    else
    return image
    end
  end


end
