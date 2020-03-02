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

  describe "instance methods" do
    it 'can count all medals a olympian has' do
      team = Team.create(name: 'Murica')
      sport = Sport.create(name: 'Sleeping')
      event = Event.create(name: 'Longest Sleep', sport: sport)

      sport_2 = Sport.create(name: 'Swimming')
      event_2 = Event.create(name: 'Diving', sport: sport_2)

      sport_3 = Sport.create(name: 'Drinking')
      event_3 = Event.create(name: 'Chugging', sport: sport_3)

      olympian_1 = Olympian.create(
        name: 'David',
        sex: 'M',
        age: 19,
        height: 115,
        weight: 112,
        sport_id: sport.id,
        team_id: team.id)

      olympian_event_1 = OlympianEvent.create(medal: 'Bronze', olympian: olympian_1, event: event)
      olympian_event_1 = OlympianEvent.create(medal: 'Gold', olympian: olympian_1, event: event_2)
      olympian_event_1 = OlympianEvent.create(medal: 'NA', olympian: olympian_1, event: event_3)

      expect(olympian_1.total_medals_won).to eq(2)
    end

    it 'can return team name' do
      team = Team.create(name: 'Murica')
      sport = Sport.create(name: 'Sleeping')
      event = Event.create(name: 'Longest Sleep', sport: sport)

      olympian_1 = Olympian.create(
        name: 'David',
        sex: 'M',
        age: 19,
        height: 115,
        weight: 112,
        sport_id: sport.id,
        team_id: team.id)

      expect(olympian_1.team_name).to eq(team.name)
    end

    it 'can return sport name' do
      team = Team.create(name: 'Murica')
      sport = Sport.create(name: 'Sleeping')
      event = Event.create(name: 'Longest Sleep', sport: sport)

      olympian_1 = Olympian.create(
        name: 'David',
        sex: 'M',
        age: 19,
        height: 115,
        weight: 112,
        sport_id: sport.id,
        team_id: team.id)

      expect(olympian_1.sport_name).to eq(sport.name)
    end
  end
end
