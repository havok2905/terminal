require_relative '../lib/validator.rb'
require_relative '../lib/whitelist.rb'
require_relative '../lib/parser.rb'

describe Terminal::Validator do

  let(:validator) do
    input = 'cd test && ls | grep foobar'
    whitelist = Terminal::WhiteList.commands
    parsed_input = Terminal::Parser.new(input).parse
    Terminal::Validator.new whitelist, parsed_input
  end

  describe 'attr' do
    it 'should have all attr readers' do
      expect(validator).to respond_to :whitelist
      expect(validator).to respond_to :parsed_input
    end
  end

  describe '.initialize' do
    it 'should exist' do
      expect(validator).to be_truthy
    end
  end

  describe 'whitelisted?' do
    it 'should return true if all commands are whitelisted' do
      expect(validator.whitelisted?).to eq true
    end

    it 'should return false if a command is not present in the white list' do
    end
  end

end
