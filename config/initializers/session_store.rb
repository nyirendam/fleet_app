# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_fleet_app_session',
  :secret      => '19cb4bbea8e6ab6ea811a80aefd32e58edb23bc49cc2832422c8fbfd1485a293f2808bc5197e7258708fe818381143df3daa7f9d77efaf3d5c4cb2db5255efc8'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
