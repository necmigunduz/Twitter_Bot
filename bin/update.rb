require 'dotenv'
require 'twitter'
require_relative '../lib/ins_taweet'

Dotenv.load('./.env')

post = InsTaweet.new

post.post_tweets
