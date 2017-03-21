class Tweet < ApplicationRecord
  belongs_to :user

  validates :message, presence: true, length: {maximum: 140, too_long: "Tweets are 140 characters MAX"}
end
