# frozen_string_literal: true

require 'dotenv'
require 'twitter'
require_relative '../lib/insTaweet.rb'

Dotenv.load('./.env')

post = InsTaweet.new

post.post_tweets
