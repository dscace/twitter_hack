class Tweet < ApplicationRecord
  belongs_to :user

  has_many :tweet_tags
  has_many :tag, through: :tweet_tags

  validates :message, presence: true
  validates :message, length: {maximum: 140, 
  too_long: "A tweet is only 140 max. Everybody knows that!"}
  
end
