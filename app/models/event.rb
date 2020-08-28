class Event < ApplicationRecord
  belongs_to :organizer, class_name: 'User'
  has_many :attendances, foreign_key: :organized_event_id
  has_many :event_attendees, through: :attendances, source: :attendee
end
