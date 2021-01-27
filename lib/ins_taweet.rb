# rubocop:disable Layout/LineLength

require 'open-uri'
require 'rss'
require 'twitter'

class InsTaweet
  attr_reader :client, :message, :tweets
  attr_writer :tweets
  
  def initialize(*_url)
    @url = nil
    @tweets = []
    @feed = {}
    @client = nil
    @message = []
  end

  def post_tweets
    @message = InsTaweet.new.run
    access
    @message.each { |item| @client.update(item) }
    @message.each { |item| puts item }
    sleep 1 # Twelve hours interval
  end

  def run
    tweet
  end

  private
  def access
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['consumer_key']
      config.consumer_secret = ENV['consumer_secret']
      config.access_token = ENV['access_token']
      config.access_token_secret = ENV['access_token_secret']
    end
  end
  

  def tweet
    @url = 'https://rss.app/feeds/vULnRqsuMJvc8tZZ.xml'

    URI.open(@url) do |rss|
      @feed = RSS::Parser.parse(rss)

      @feed.items.each do |item|
        date = item.pubDate.strftime('%m/%d/%Y')
        tweet = 'You can see my graphic designs by clicking on the link below:' "\nHashtags: #{item.title}" + "\nDate: #{date} " + "\nLink: #{item.link}"
        @tweets << tweet
      end
    end
    @tweets
  end
end

# rubocop:enable Layout/LineLength
