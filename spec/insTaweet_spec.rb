# frozen_string_literal: true

require 'twitter'
require_relative 'spec_helper.rb'
require_relative '../lib/insTaweet.rb'

# TwitterBot -------------------------------------------------------------------------- #
RSpec.describe InsTaweet do
  let(:my_bot) { InsTaweet.new }
  subject(:ctrl) { described_class.new }

  # initialize
  describe '#initialize' do
    # No need to test this standard method
  end
  # run
  describe '#run' do
    it 'run another method in the class' do
      expect(my_bot.run).to be_an_instance_of(Array)
    end
  end
  # tweet
  describe '#tweet' do
    it 'parse body from an rss and prepares an array of tweets' do
      expect(my_bot.tweet).to be_an_instance_of(Array)
    end
  end
end
