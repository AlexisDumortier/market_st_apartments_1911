# pry(main)> require './lib/renter'
# # => true

# pry(main)> require './lib/apartment'
# # => true

# pry(main)> renter1 = Renter.new("Jessie")    
# # => #<Renter:0x00007a15c93af80...>

# pry(main)> renter1.name
# # => "Jessie"

require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/renter'

class RenterTest < Minitest::Test

  def setup 
    @renter = Renter.new("Jessie")
  end
  
  def test_it_exists
    assert_instance_of Renter, @renter
  end
    
  def test_it_has_a_name
    assert_equal "Jessie", @renter.name
  end 

end