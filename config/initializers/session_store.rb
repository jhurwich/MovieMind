# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_moviemind_session',
  :secret      => 'cc8c8e28c54ea491b319f7dbc8217a9ecf43396534fe8054d5d1438e292148bca5e9e68325f68f79955bb601ead0ea4811195e3518b030e582ebcd733bb5934e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
