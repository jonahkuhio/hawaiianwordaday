class AddTokenToEmailSubscriptions < ActiveRecord::Migration
  def self.up
    add_column :email_subscriptions, :token, :string
    add_index :email_subscriptions, :token
  end

  def self.down
    remove_column :email_subscriptions, :token
  end
end
