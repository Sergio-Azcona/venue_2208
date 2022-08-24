class Venue
  attr_reader :name, :capacity, :patrons
  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @patrons = Array.new
  end

  def add_patron(paying_customer)
    @patrons << paying_customer
  end

  def yell_at_patrons
    @patrons.map { |patron| patron.upcase }
  end

  def over_capacity?
    @patrons.length >= (@capacity + 1)
  end

  def kick_out
    while over_capacity? do 
      @patrons.pop 
    end
  end
end
