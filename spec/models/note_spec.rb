require 'rails_helper'

RSpec.describe Note, :type => :model do
  it "should require a body" do
    note = Note.new(body: "")
    expect(note).not_to be_valid
  end

  it "has a body of Hello World" do
    note = Note.new(body: "Hello World")
    expect(note.body).to eq("Hello World")
  end

  it "should be a valid Note" do
    note = Note.new(title: "New note!", address: "1408 over there", body: "This here is a new note", url: "www.google.com")
    expect(note).to be_valid
  end

  it "should have share set to true" do
    note = Note.new
    expect(note.share).to eq(true)
  end

  it "should let share toggle to false" do
    note = Note.new
    note.toggle(:share)
    expect(note.share).to eq(false)
  end
end
