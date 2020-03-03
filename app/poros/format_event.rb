class FormatEvent
  def initialize(sport)
    @sport = sport.name
    @events = sport.event_names
  end
end
