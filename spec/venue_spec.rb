require 'rspec'
require './lib/venue'

describe Venue do
  describe '#initialize' do
    it 'is a venue' do
      # skip
      venue = Venue.new('Bluebird', 4)
      expect(venue).to be_a Venue
    end

    it 'can read the name' do
      # skip
      venue = Venue.new('Bluebird', 4)
      expect(venue.name).to eq 'Bluebird'
    end

    it 'can read the capacity' do
      # skip
      venue = Venue.new('Bluebird', 4)
      expect(venue.capacity).to eq 4
    end

    it 'has no patrons by default' do
      # skip
      venue = Venue.new('Bluebird', 4)
      expect(venue.patrons).to eq []
    end
  end

  # Iteration 2
  describe '#add_patron' do
    it 'returns a list of patrons' do
      # skip
      venue = Venue.new('Bluebird', 4)
      venue.add_patron('Mike')
      venue.add_patron('Megan')
      venue.add_patron('Bob')

      expect(venue.patrons).to eq ['Mike', 'Megan', 'Bob']
    end
  end

  describe '#yell_at_patrons' do
    it 'returns a list of uppercased names' do
      # skip
      venue = Venue.new('Bluebird', 4)
      venue.add_patron('Mike')
      venue.add_patron('Megan')
      venue.add_patron('Bob')
      # require 'pry';binding.pry
      expect(venue.yell_at_patrons).to eq ['MIKE', 'MEGAN', 'BOB']
    end
  end

  context 'Iteration 3 and iteration 4' do
    let(:venue) { Venue.new('Bluebird', 4) }

    it 'should inform if the venue is over capacity' do
      venue.add_patron('Mike')
      venue.add_patron('Megan')
      venue.add_patron('Bob')
      expect(venue.over_capacity?).to eq false
  
      venue.add_patron('James')
      # require 'pry';binding.pry
      venue.add_patron('Cat')
      expect(venue.over_capacity?).to eq true
    end

    it "should remove last patrons to come in if the venue is over capacity" do
      venue.add_patron('Mike')
      venue.add_patron('Megan')
      venue.add_patron('Bob')
      expect(venue.over_capacity?).to eq false
  
      venue.add_patron('James')
      venue.add_patron('Cat')
      expect(venue.over_capacity?).to eq true
      venue.kick_out
      venue.add_patron('Kristen')
      venue.add_patron('Erin')
      venue.add_patron('Jamison')
      venue.add_patron('Abdul')
      expect(venue.over_capacity?).to eq true
      # require 'pry';binding.pry
      venue.kick_out
      # require 'pry';binding.pry
      expect(venue.over_capacity?).to eq false
    end
  end
end
