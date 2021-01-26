# rubocop:disable Layout/LineLength

require 'open-uri'
require 'rss'
require 'twitter'

class InsTaweet
  attr_reader :client
  attr_reader :message

  def initialize(*_url)
    @url = nil
    @tweets = []
    @feed = {}
    @client = nil
    @message = []
  end

  def access
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['consumer_key']
      config.consumer_secret = ENV['consumer_secret']
      config.access_token = ENV['access_token']
      config.access_token_secret = ENV['access_token_secret']
    end
  end

  def run
    tweet
  end

  def tweet
    @url = 'https://rss.app/feeds/vULnRqsuMJvc8tZZ.xml'

    Kernel.open(@url) do |rss|
      @feed = RSS::Parser.parse(rss)

      @feed.items.each do |item|
        date = item.pubDate.strftime('%m/%d/%Y')
        tweet = 'You can see my graphic designs by clicking on the link below:' "\nHashtags: #{item.title}" + "\nDate: #{date} " + "\nLink: #{item.link}"
        @tweets << tweet
      end
    end
    @tweets
  end

  def post_tweets
    @message = InsTaweet.new.run
    access
    @message.each do |item|
      @client.update(item)
      puts item
      sleep 43_200 # Twelve hours interval
    end
  end
end

# rubocop:enable Layout/LineLength
