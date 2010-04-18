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

    context "GET destroy" do
      context "with a token that is valid" do
        setup do
          @email_subscription = Factory(:email_subscription)
          get :destroy, :id => @email_subscription.token
        end
        should_respond_with :success
        should_assign_to :email_subscription
        should "remove the email subscription" do
          assert_raise(ActiveRecord::RecordNotFound) do
            EmailSubscription.find(@email_subscription.id)
          end
        end
      end
      context "with an invalid token" do
        setup do
          get :destroy, :id => 'xxx'
        end
        should_respond_with :success
        should_render_template :destroy_failed
      end
    end
  end
end
