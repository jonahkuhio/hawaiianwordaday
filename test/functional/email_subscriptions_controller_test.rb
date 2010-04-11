require 'test_helper'

class EmailSubscriptionsControllerTest < ActionController::TestCase
  context "email subscriptions controller" do
    context "POST create" do
      setup do
        post :create, :email_subscription => {:email => 'bob@example.com'}
      end
      should_redirect_to("root path") { root_path }
      should "create the email subscription in the database" do
        assert_not_nil EmailSubscription.last
      end
    end
  end
end
