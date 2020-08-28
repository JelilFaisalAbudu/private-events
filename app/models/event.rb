class Event < ApplicationRecord
  belongs_to :organizer, class_name: 'User'
  has_many :attendances, foreign_key: :organized_event_id, dependent: :destroy
  has_many :event_attendees, through: :attendances, source: :attendee, dependent: :destroy

  scope :upcomming_events, -> { where('date >= ?', Time.zone.now)}
  scope :previous_events, -> { where('date < ?', Time.zone.now)}
  
  # Ex:- scope :active, -> {where(:active => true)}

  validates :title, presence: true, length: {maximum: 50, minimum: 5}
  validates :location, presence: true
  validates :date, presence: true
  validates :details, presence: true, length: {maximum:250, minimum: 30}
  
end
