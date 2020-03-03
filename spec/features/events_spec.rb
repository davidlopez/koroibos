describe "api/v1/events Endpoint", :type => :request do
  it "shows all sports with relates events" do
    OlympianEvent.destroy_all
    Olympian.destroy_all
    Event.destroy_all
    Team.destroy_all
    Sport.destroy_all

    sport = Sport.create(name: 'Sleeping')
    event = Event.create(name: 'Longest Sleep', sport: sport)
    event_1 = Event.create(name: 'Shortest Sleep', sport: sport)
    event_2 = Event.create(name: 'Quickest Name', sport: sport)

    sport_2 = Sport.create(name: 'Eating')
    event_3 = Event.create(name: 'Biggest Eat', sport: sport_2)
    event_4 = Event.create(name: 'Smallest Eat', sport: sport_2)
    event_5 = Event.create(name: 'Quickest Eat', sport: sport_2)

    get "/api/v1/events"
    events = JSON.parse(response.body)

    expect(events["events"][0]["sport"]).to eq(sport.name)
    expect(events["events"][0]["events"].include?(event.name)).to be_truthy
    expect(events["events"][0]["events"].include?(event_1.name)).to be_truthy
    expect(events["events"][0]["events"].include?(event_2.name)).to be_truthy

    expect(events["events"][1]["sport"]).to eq(sport_2.name)
    expect(events["events"][1]["events"].include?(event_3.name)).to be_truthy
    expect(events["events"][1]["events"].include?(event_4.name)).to be_truthy
    expect(events["events"][1]["events"].include?(event_5.name)).to be_truthy
  end

  it "shows medalists for specific event" do
    OlympianEvent.destroy_all
    Olympian.destroy_all
    Event.destroy_all
    Team.destroy_all
    Sport.destroy_all

    sport = Sport.create(name: 'Sleeping')
    event = Event.create(name: 'Longest Sleep', sport: sport)
    team = Team.create(name: 'Murica')
    team_2 = Team.create(name: 'Canada')
    team_3 = Team.create(name: 'Russia')
    team_4 = Team.create(name: 'Japan')

    olympian_1 = Olympian.create(
      name: 'David',
      sex: 'M',
      age: 19,
      height: 115,
      weight: 112,
      sport_id: sport.id,
      team_id: team.id)

    olympian_2 = Olympian.create(
      name: 'Marcella',
      sex: 'F',
      age: 26,
      height: 119,
      weight: 200,
      sport_id: sport.id,
      team_id: team_2.id)

    olympian_3 = Olympian.create(
      name: 'Graham',
      sex: 'M',
      age: 19,
      height: 115,
      weight: 112,
      sport_id: sport.id,
      team_id: team_3.id)

    olympian_4 = Olympian.create(
      name: 'Zac',
      sex: 'M',
      age: 26,
      height: 119,
      weight: 200,
      sport_id: sport.id,
      team_id: team_4.id)

    olympian_event_1 = OlympianEvent.create(medal: 'Bronze', olympian: olympian_1, event: event)
    olympian_event_2 = OlympianEvent.create(medal: 'Gold', olympian: olympian_2, event: event)
    olympian_event_3 = OlympianEvent.create(medal: 'Silver', olympian: olympian_3, event: event)
    olympian_event_4 = OlympianEvent.create(medal: 'NA', olympian: olympian_4, event: event)

    get "/api/v1/events/#{event.id}/medalists"
    event_with_medalists = JSON.parse(response.body)

    expect(event_with_medalists["event"]).to eq(event.name)
    expect(event_with_medalists["medalists"].length).to eq(3)
  end
end
