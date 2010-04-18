require 'test_helper'

class WordTest < ActiveSupport::TestCase
  should_belong_to :category
  should_belong_to :user

  should_validate_presence_of :term
  should_validate_presence_of :definition
  should_validate_presence_of :word_in_context
  should_validate_uniqueness_of :term

  should "validate term uniqueness ignoring case" do
    @word = Factory(:word)
    e = assert_raise(ActiveRecord::RecordInvalid) do
      Factory(:word, :term => @word.term.upcase)
    end
    assert_equal "Validation failed: Term has already been taken", e.message
  end
end
