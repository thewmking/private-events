class Attending < ApplicationRecord
  belongs_to :event
  belongs_to :attendee, class_name: 'User'
  validates :attendee_id, uniqueness: { scope: :event_id}
end
