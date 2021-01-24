require 'rubygems'
require 'bundler/setup'
require 'twitter'
require 'httparty'
require 'nokogiri'
require 'dotenv'

Dotenv.load('./.env')


twitter = Twitter::REST::Client.new do |config|
  config.consumer_key = ENV['consumer_key']
  config.consumer_secret     = ENV['consumer_secret']
  config.access_token        = ENV['access_token'] 
  config.access_token_secret = ENV['access_token_secret']
end

text = "Still having difficulty with HTTParty and Nokogiri"

twitter.update(text)

