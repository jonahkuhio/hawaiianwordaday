require 'test_helper'

class UnusedWordTest < ActiveSupport::TestCase
  context UnusedWord do
    should_validate_presence_of :word
    should_validate_presence_of :definition
    should_validate_presence_of :word_in_context
  end
end
