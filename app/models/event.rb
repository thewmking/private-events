class Event < ApplicationRecord
  scope :future, -> { where("date > ?", Date.today) }
  scope :past,   -> { where("date < ?", Date.today) }

  belongs_to :creator, class_name: 'User'
  has_many :attendings
  has_many :attendees, through: :attendings
  has_many :comments
end
