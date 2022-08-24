class Venue
  attr_reader :name, :capacity, :patrons
  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @patrons = Array.new
  end

  def add_patron(person)
    @patrons << person
  end

  def yell_at_patrons
    @patrons.map { |patron| patron.upcase }
  end
end
