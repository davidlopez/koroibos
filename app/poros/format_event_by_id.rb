class FormatEventById
  def initialize(event)
    @event = event.name
    @medalists = event.olympians_with_medals.map {|o| FormatMedalist.new(o, event.id)}
  end
end
