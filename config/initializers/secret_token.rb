# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.

require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file
    token = SecureRandom.hex(64)
    File.write(token_file,token)
    token
  end
end

#SampleApp::Application.config.secret_key_base = '35ee4eb7be3ec8ec917cb0bf15534310dc08ea11a7f50e8a3fbfc221602d6520918aa07fef45aa11eb07494a869d90e68c6f14064e80f694563ccadfc63d5095'
SampleApp::Application.config.secret_key_base = secure_token
