require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/renter'
require_relative '../lib/apartment'
require_relative '../lib/building'

class BuildingTest < Minitest::Test

  def setup 
    @unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    @unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 1, bedrooms: 2})   
    @unit3 = Apartment.new({number: "C3", monthly_rent: 1150, bathrooms: 2, bedrooms: 2})
    @unit4 = Apartment.new({number: "D4", monthly_rent: 1500, bathrooms: 3, bedrooms: 2})

    @renter1 = Renter.new("Spencer")  
    @building = Building.new
    
    
end
  
  def test_it_exists
    assert_instance_of Building, @building
  end
   
  def test_it_is_has_a_units_attribute_initialized_without_units
    assert_equal [], @building.units
  end 

  def test_units_can_be_added_to_the_building
    assert_equal [], @building.units
    @building.add_unit(@unit1)
    assert_equal [@unit1], @building.units
    @building.add_unit(@unit2)
    assert_equal [@unit1, @unit2], @building.units
  end

  def test_it_can_return_the_average_rent
    @building.add_unit(@unit1)
    @building.add_unit(@unit2)
    assert_equal 1099.5, @building.average_rent
  end

  def test_it_can_return_the_total_rent
    @building.add_unit(@unit1)
    @building.add_unit(@unit2)
    assert_equal 2199, @building.total_rent
  end

  def test_it_can_return_the_renter_with_highest_rent
    assert_equal nil, @building.renter_with_highest_rent
    @building.add_unit(@unit1)
    @building.add_unit(@unit2)
    @building.add_unit(@unit3)
    @unit2.add_renter(@renter1)
    @renter2 = Renter.new("Jessie")
    @renter3 = Renter.new("Max") 
    assert_equal @renter1, @building.renter_with_highest_rent
    @unit1.add_renter(@renter2)
    assert_equal @renter2, @building.renter_with_highest_rent
    @unit3.add_renter(@renter3)
    assert_equal @renter2, @building.renter_with_highest_rent
  end

  def test_it_can_return_annual_breakdown
    breakdown0 = {}
    assert_equal breakdown0, @building.annual_breakdown
    @building.add_unit(@unit1)
    @building.add_unit(@unit2)
    @building.add_unit(@unit3)
    @unit2.add_renter(@renter1)
    breakdown1 = {"Spencer" => 11988}
    assert_equal breakdown1, @building.annual_breakdown
    @renter2 = Renter.new("Jessie")
    @unit1.add_renter(@renter2)
    breakdown2 = {"Jessie" => 14400, "Spencer" => 11988}
    assert_equal breakdown2, @building.annual_breakdown
  end

end