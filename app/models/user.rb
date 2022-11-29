class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :rank
  belongs_to :gender

  validates :nickname, presence: true

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :rank_id
    validates :gender_id
  end
end
