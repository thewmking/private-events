class User < ApplicationRecord
  has_many :created_events, foreign_key: :creator_id, class_name: 'Event'
  has_many :attendings, foreign_key: :attendee_id
  has_many :events, through: :attendings
  has_many :comments
  validates :name,  presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
end
