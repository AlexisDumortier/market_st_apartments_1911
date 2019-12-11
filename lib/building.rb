class Building

  attr_reader :units

  def initialize
    @units = []
  end 

  def add_unit(unit)
    @units << unit
  end

  def average_rent
    @units.empty? ? true : total_rent / @units.size.to_f
  end

  def total_rent
    @units.reduce(0) do |total, unit|
      total += unit.monthly_rent
      total
    end
  end

end