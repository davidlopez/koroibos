class OlympianStats
  def initialize
    @total_competing_olympians = Olympian.count
    @average_weight = OlympianWeight.new
    @average_age = Olympian.average_age
  end
end
