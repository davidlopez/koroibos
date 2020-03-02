require 'rails_helper'

RSpec.describe Olympian, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :sex }
  it { should validate_presence_of :age }
  it { should validate_presence_of :height }
  it { should validate_presence_of :weight }
  it { should belong_to :team }
  it { should belong_to :sport }
  it { should have_many :olympian_events }
  it { should have_many :events }
end
