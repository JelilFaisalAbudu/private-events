class Attendance < ApplicationRecord
  belongs_to :attendee, class_name: 'User'
  belongs_to :organized_event, class_name: 'Event'
end
