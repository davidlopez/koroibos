class FormatMedalist
  def initialize(olympian, event_id)
    @name = olympian.name
    @team = olympian.team_name
    @age = olympian.age
    @medal = olympian.medal(event_id)
  end
end
