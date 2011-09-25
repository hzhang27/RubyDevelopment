require "rspec"
require "../calculator"

describe "My Calculator's add method'" do

  it "should return 0 for a zero-length string input" do
    sut = Calculator.new
    result = sut.add("")
    result.should equal 0
  end
end