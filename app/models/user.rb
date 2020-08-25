class User < ApplicationRecord
	has_many :organized_events, foreign_key: :organizer_id, class_name: 'Event'
	has_many :attendances, foreign_key: :attendee_id
	has_many :attended_events, through: :attendances, source: :organized_event
end
