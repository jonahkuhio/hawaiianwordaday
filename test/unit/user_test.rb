require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should_validate_presence_of :login
  should_validate_presence_of :password
  should_validate_presence_of :email
  should_validate_uniqueness_of :login
  should_validate_uniqueness_of :email
  should_have_many :words

  context "password hashing" do
    should_eventually "be tested"
  end

  context ".authenticate" do
    should_eventually "be tested"
  end
end
