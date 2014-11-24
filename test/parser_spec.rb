require_relative '../lib/parser.rb'

describe Terminal::Parser do

  let(:parser) { Terminal::Parser.new('ls -la') }

  describe 'attr' do
    it 'should have all attr readers' do
      expect(parser).to respond_to :input
      expect(parser).to respond_to :response
    end
  end

  describe '.initialize' do
    it 'should exist' do
      expect(parser).to be_truthy
    end
  end

  describe '.command_split' do
  end

  describe '.key_value_pair?' do
    it 'should return truthy for proper pairs' do
      expect(parser.key_value_pair?('--la=foo')).to be_truthy
    end

    it 'should return nil for unproper pairs' do
      expect(parser.key_value_pair?('--la')).to be_falsey
      expect(parser.key_value_pair?('--')).to be_falsey

      expect(parser.key_value_pair?('-la=foo')).to be_falsey
      expect(parser.key_value_pair?('-l-a=foo')).to be_falsey
    end
  end

  describe '.flag?' do
    it 'should return truthy for flags' do
      expect(parser.flag?('-la')).to be_truthy
    end

    it 'should return nil for anything not a flag' do
      expect(parser.flag?('la')).to be_falsey
      expect(parser.flag?('l-a')).to be_falsey
      expect(parser.flag?('la-')).to be_falsey
    end
  end

  describe '.parse' do
  end


end
