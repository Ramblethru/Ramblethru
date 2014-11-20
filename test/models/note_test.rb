require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  should validate_presence_of(:body)
end
