require 'rails_helper'

RSpec.describe Ramble, :type => :model do
  it "should require a destination" do
    ramble = Ramble.new(destination: "")
    expect(ramble).not_to be_valid
  end

  it "has a destination of Durham, NC" do
    ramble = Ramble.new(destination: "Durham, NC")
    expect(ramble.destination).to eq("Durham, NC")
  end

  it "should be valid Ramble" do
    ramble = Ramble.new(destination: "Durham", name: "Going to Durham!", start_date: "2014-11-30", end_date: "2015-01-04")
    expect(ramble).to be_valid
  end
end
