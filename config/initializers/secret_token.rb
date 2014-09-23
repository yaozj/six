# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#Six::Application.config.secret_key_base = '7046d1ff4cda01074951b8d663a297f017e48acadb1da5c397211a75bc4b3c1fe142bb698b14aa17e6d5f64ab3a6a089a52597e0f12c384f79979bdb601eacfe'
require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
  # Use the existing token
    File.read(token_file).chomp
  else
  # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

Six::Application.config.secret_key_base = secure_token
