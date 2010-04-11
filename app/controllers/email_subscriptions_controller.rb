class EmailSubscriptionsController < ApplicationController
  def create
    @email_subscription = EmailSubscription.new(params[:email_subscription])
    @email_subscription.save
    redirect_to root_path
  end
end
