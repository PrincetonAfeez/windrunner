# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_windrunner_session',
  :secret      => '760223299f1b8939d906c357458c0144ba24c87c6606f841a17991e26777f1c9229d4e7e9d706dd84295258a8e4f1dfd21422a8045a2b26572a3692445b3fb6f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
