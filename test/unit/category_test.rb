require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  should_have_many :words
  should_validate_uniqueness_of :name
end
