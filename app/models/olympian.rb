class Olympian < ApplicationRecord
  validates_presence_of :name, :sex, :age, :height, :weight
  belongs_to :team
  belongs_to :sport
  has_many :olympian_events
  has_many :events, through: :olympian_events
  enum sex: [:M, :F]
end
