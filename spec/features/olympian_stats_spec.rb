describe "api/v1/olympian_stats Endpoint", :type => :request do
  before(:each) do
    OlympianEvent.destroy_all
    Olympian.destroy_all
    Event.destroy_all
    Team.destroy_all
    Sport.destroy_all

    team = Team.create(name: 'Murica')
    sport = Sport.create(name: 'Sleeping')
    event = Event.create(name: 'Longest Sleep', sport: sport)

    @olympian_1 = Olympian.create(
      name: 'David',
      sex: 'M',
      age: 19,
      height: 115,
      weight: 112,
      sport_id: sport.id,
      team_id: team.id)

    @olympian_2 = Olympian.create(
      name: 'Marcella',
      sex: 'F',
      age: 26,
      height: 119,
      weight: 200,
      sport_id: sport.id,
      team_id: team.id)

    olympian_event_1 = OlympianEvent.create(medal: 'Bronze', olympian: @olympian_2, event: event)
  end

  it "shows olympian stats in the db" do
    get "/api/v1/olympian_stats"
    stats = JSON.parse(response.body)

    expect(stats["olympian_stats"]["total_competing_olympians"]).to eq(2)
    expect(stats["olympian_stats"]["average_weight"]["unit"]).to eq("kg")
    expect(stats["olympian_stats"]["average_weight"]["male_olympians"]).to eq(112)
    expect(stats["olympian_stats"]["average_weight"]["female_olympians"]).to eq(200)
    expect(stats["olympian_stats"]["average_age"]).to eq(22.5)
  end
end
