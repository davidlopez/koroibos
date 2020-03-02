class OlympianCollection
  def initialize(olympians)
    @olympians = olympians.map {|o| FormatOlympian.new(o)}
  end
end
