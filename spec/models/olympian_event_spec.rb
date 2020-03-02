require 'rails_helper'

RSpec.describe OlympianEvent, type: :model do
  it { should validate_presence_of :medal }
  it { should belong_to :olympian }
  it { should belong_to :event }
end
