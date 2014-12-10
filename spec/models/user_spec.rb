require 'rails_helper'

RSpec.describe User, :type => :model do

  it "should require a username" do
    user = User.new(name: "")
    expect(user).not_to be_valid
  end

  it "has a name of Steve" do
    user = User.new(name:"Steve")
    expect(user.name).to eq("Steve")
  end

  it "should require a valid email" do
    user = User.new(name: "Tom", email: "@")
    expect(user).not_to be_valid
  end

  it "should require a valid email" do
    user = User.new(name: "Steve", email: "   noah@noah.com   ")
    expect(user).not_to be_valid
  end

  it "has an email of noah@noah.com" do
    user = User.new
    user.email = "noah@noah.com"
    expect(user.email).to eq("noah@noah.com")
  end
end