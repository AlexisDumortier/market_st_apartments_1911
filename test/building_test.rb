require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/renter'
require_relative '../lib/apartment'
require_relative '../lib/building'


class BuildingTest < Minitest::Test

  def setup 
    @unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    @unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})   
    @renter1 = Renter.new("Jessie")
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

end