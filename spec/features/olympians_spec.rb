require 'rails_helper'

describe "api/v1/olympians Endpoint", :type => :request do
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

  it "shows every olympian in the db" do

    get "/api/v1/olympians"
    olympians = JSON.parse(response.body)

    expect(olympians['olympians'][0]['name']).to eq(@olympian_1.name)
    expect(olympians['olympians'][0]['team']).to eq(@olympian_1.team.name)
    expect(olympians['olympians'][0]['age']).to eq(@olympian_1.age)
    expect(olympians['olympians'][0]['sport']).to eq(@olympian_1.sport.name)
    expect(olympians['olympians'][0]['total_medals_won']).to eq(@olympian_1.total_medals_won)

    expect(olympians['olympians'][1]['name']).to eq(@olympian_2.name)
    expect(olympians['olympians'][1]['team']).to eq(@olympian_2.team.name)
    expect(olympians['olympians'][1]['age']).to eq(@olympian_2.age)
    expect(olympians['olympians'][1]['sport']).to eq(@olympian_2.sport.name)
    expect(olympians['olympians'][1]['total_medals_won']).to eq(@olympian_2.total_medals_won)
  end

  it "shows youngest olympian in the db" do

    get "/api/v1/olympians?age=youngest"
    olympians = JSON.parse(response.body)

    expect(olympians['olympians'].length).to eq(1)
    expect(olympians['olympians'][0]['name']).to eq(@olympian_1.name)
    expect(olympians['olympians'][0]['team']).to eq(@olympian_1.team.name)
    expect(olympians['olympians'][0]['age']).to eq(@olympian_1.age)
    expect(olympians['olympians'][0]['sport']).to eq(@olympian_1.sport.name)
    expect(olympians['olympians'][0]['total_medals_won']).to eq(@olympian_1.total_medals_won)
  end

  it "shows oldest olympian in the db" do

    get "/api/v1/olympians?age=oldest"
    olympians = JSON.parse(response.body)

    expect(olympians['olympians'].length).to eq(1)
    expect(olympians['olympians'][0]['name']).to eq(@olympian_2.name)
    expect(olympians['olympians'][0]['team']).to eq(@olympian_2.team.name)
    expect(olympians['olympians'][0]['age']).to eq(@olympian_2.age)
    expect(olympians['olympians'][0]['sport']).to eq(@olympian_2.sport.name)
    expect(olympians['olympians'][0]['total_medals_won']).to eq(@olympian_2.total_medals_won)
  end
end
