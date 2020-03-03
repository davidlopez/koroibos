class Sport < ApplicationRecord
  validates_presence_of :name
  has_many :olympians
  has_many :events

  def event_names
    events.pluck(:name)
  end
end
