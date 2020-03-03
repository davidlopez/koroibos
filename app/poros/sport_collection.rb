class SportCollection
  def initialize(sports)
    @events = sports.map {|s| FormatEvent.new(s)}
  end
end
