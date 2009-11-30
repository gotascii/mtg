# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_mtg_session',
  :secret      => '546dfb5ea495ce9bc6bf15e4afaab61750b990d41f2a2888a212a9dcdffcd4c9777c4bbc2e81b7e3820bf84f2186bd538220a2d8043cdda414110fa0a419b364'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
