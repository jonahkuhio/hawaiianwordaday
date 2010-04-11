# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_hawaiianwordaday_session',
  :secret      => '7479288cafb79e7ab833a83c87e89037311a9f0ab0f606063533bcfb0045834a9f0a32b89c7a4bb2b16eb7eee04e6d2a919bb3866d11a945772c7931d6388117'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
