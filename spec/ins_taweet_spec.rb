require 'twitter'
require 'dotenv'
require_relative 'spec_helper.rb'
require_relative '../lib/ins_taweet'

Dotenv.load('./.env')

RSpec.describe InsTaweet do
  # before :each do
  #   @user = InsTaweet.new(message:["a","b","necmi"])
  # end

  let(:my_bot) { InsTaweet.new }

  describe '#initialize' do
  end

  describe '#run' do
    it 'run another method in the class' do
      expect(my_bot.run).to be_an_instance_of(Array)
    end
  end

  describe '#tweet' do
    it 'parse body from an rss and prepares an array of tweets' do
      expect(my_bot.tweet).to be_an_instance_of(Array)
    end
  end

  describe '#post_tweets' do
    it 'tweets the items of the array named as tweets' do
      expect(my_bot.post_tweets).to eql(1)
    end
  end
end
