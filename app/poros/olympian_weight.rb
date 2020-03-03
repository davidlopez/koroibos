class OlympianWeight
  def initialize
    @unit = 'kg'
    @male_olympians = Olympian.age_by_sex('M')
    @female_olympians = Olympian.age_by_sex('F')
  end
end
