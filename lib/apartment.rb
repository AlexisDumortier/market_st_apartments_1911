
class Apartment

  attr_reader :number, :monthly_rent, :bathrooms, :bedrooms, :renter

  def initialize(info) 
    @number = info[:number] 
    @monthly_rent = info[:monthly_rent] 
    @bathrooms = info[:bathrooms] 
    @bedrooms =info[:bedrooms] 
    @renter = []
  end 

  def add_renter(renter)
    @renter << renter # if @renter.size == 0
  end

end