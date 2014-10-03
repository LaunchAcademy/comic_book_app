@client = Marvel::Client.new

@client.configure do |config|
  config.api_key = ENV['MARVEL_API_KEY_PUBLIC']
  config.private_key = ENV['MARVEL_API_KEY_PRIVATE']
end
