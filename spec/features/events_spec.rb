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
end
