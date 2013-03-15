require './domain.rb'


describe @network, "#distance_between" do

  before :each do
    @network = Network.new

    @dave = Programmer.new("Dave")
    @bob = Programmer.new("Bob")
  end

  it "returns 0 for same person" do
    @network.add(@dave)
    @network.distance_between(@dave, @dave).should eq 0
  end

  it "returns 1 for people you've recommended" do
    @network.add(@dave)
    @network.add(@bob)

    @network.recommendation(@dave, @bob)

    @network.distance_between(@dave, @bob).should eq 1
  end

  it "returns 1 for people that's recommended you" do
    @network.add(@dave)
    @network.add(@bob)

    @network.recommendation(@dave, @bob)

    @network.distance_between(@bob, @dave).should eq 1
  end
end