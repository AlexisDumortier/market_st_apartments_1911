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

  def renter_with_highest_rent
    max_rent = 0
    max_renter = nil
    @units.each do |unit|
      if !unit.renter.empty? && unit.monthly_rent > max_rent 
        max_renter = unit.renter[0]
        max_rent = unit.monthly_rent
      end
    end
    max_renter
  end

end