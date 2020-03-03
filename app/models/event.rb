class Event < ApplicationRecord
  validates_presence_of :name
  belongs_to :sport
  has_many :olympian_events
  has_many :olympians, through: :olympian_events

  def olympians_with_medals
    olympians.joins(:olympian_events).
    select('olympians.*').
    distinct.
    where('olympian_events.medal != 0')
  end
end
