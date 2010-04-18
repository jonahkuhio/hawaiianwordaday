class EmailSubscription < ActiveRecord::Base
  before_create :generate_token

  private
  def generate_token
    self.token = ActiveSupport::SecureRandom.hex(10)
  end
end
