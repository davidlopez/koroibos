require 'csv'

namespace :add_data do
  desc "Data entries from CSV data"
  task csv_to_db: :environment do
    CSV.foreach("olympian_data/olympic_data_2016.csv", headers: true) do |row|
      row = row.to_hash
      team = Team.find_or_create_by(name: row['Team'])
      sport = Sport.find_or_create_by(name: row['Sport'])
      event = Event.find_or_create_by(name: row['Event'], sport_id: sport.id)

      olympian = Olympian.find_or_create_by(
        name: row['Name'],
        sex: row['Sex'],
        age: row['Age'],
        height: row['Height'],
        weight: row['Weight'],
        sport_id: sport.id,
        team_id: team.id)
        
      olympian_event = OlympianEvent.find_or_create_by(
        medal: row['Medal'],
        event_id: event.id,
        olympian_id: olympian.id)
    end
  end
end
