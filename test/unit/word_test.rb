require 'test_helper'

class WordTest < ActiveSupport::TestCase
  should_belong_to :category
  should_belong_to :user

  should_validate_presence_of :term
  should_validate_presence_of :definition
  should_validate_presence_of :word_in_context
  should_validate_uniqueness_of :term
end
