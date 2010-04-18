require 'test_helper'

class EmailSubscriptionTest < ActiveSupport::TestCase
  context EmailSubscription do
    should "generate a token when created" do
      assert_not_nil Factory(:email_subscription).token
    end
  end
end
