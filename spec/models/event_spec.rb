require 'rails_helper'

RSpec.describe Event, type: :model do
  it { should validate_presence_of :name }
  it { should belong_to :sport }
  it { should have_many :olympian_events }
  it { should have_many :olympians }
end
