class EmailSubscriptionsController < ApplicationController
  def create
    @email_subscription = EmailSubscription.new(params[:email_subscription])
    @email_subscription.save
    redirect_to root_path
  end

  def destroy
    @email_subscription = EmailSubscription.find_by_token(params[:id])
    if @email_subscription
      @email_subscription.destroy
    else
      render :action => 'destroy_failed'
    end
  end
end
