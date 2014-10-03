require 'httparty'

class Marvel
  include HTTParty
  base_uri 'gateway.marvel.com/v1/public'

  def initialize
    @api_key = ENV['MARVEL_API_KEY_PUBLIC']
    @api_private_key = ENV['MARVEL_API_KEY_PRIVATE']
    # @options = { query: {} }


  end

  def md5
    @ts = Time.now.to_i
    Digest::MD5.new.update("#{ts}#{private_key}#{public_key}").to_s
  end

  def issues
    options = { hash:md5, ts: @ts, apikey: @api_key }
    self.class.get("/v1/public/comics", options)
  end

  # def get_cover_art(comic.title, comic.issue)
  #   url = issues
  #   image_url_path = ['data']['results'][0]['thumbnail']['path']
  #   #add on variant to end of path
  #   # WILL RETURN A URI
  #   "#{image_url}.jpg"
  # end
  #
end
