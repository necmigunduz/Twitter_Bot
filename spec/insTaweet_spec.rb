require 'twitter'
require_relative 'spec_helper.rb'
require_relative '../lib/insTaweet.rb'

# TwitterBot -------------------------------------------------------------------------- #
RSpec.describe InsTaweet do
    let(:my_bot) { InsTaweet.new }
    subject(:ctrl) { described_class.new }
  
    # run
    describe "#run" do
      it "run another method in the class" do
        expect(my_bot.run).to be_an_instance_of(Array)
      end
    end
    #tweet
    describe "#tweet" do 
        it "parse body from an rss and prepares an array of tweets" do
            expect(my_bot.tweet).to be_an_instance_of(Array)
        end
    end
    #post_tweets
    describe "#post_tweets" do
        
        describe '#initialize' do
          # No need to test this standard method
        end

        context 'when the method is called' do
            before do
              ctrl.instance_variable_set(:@message, 'Hello')
              my_bot.instance_variable_set(:@client, Twitter::REST::Client.new)
            end

            it 'calls the #update method on the client object with the @message as argument' do
                expect(my_bot.client).to receive(:update).with(ctrl.message)
                ctrl.post_tweets(my_bot.client)
            end
        end
    end
end