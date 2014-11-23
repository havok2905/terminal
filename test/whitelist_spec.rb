require_relative '../lib/whitelist.rb'

describe Terminal::WhiteList do

  let(:whitelist) { Terminal::WhiteList }

  describe 'attr' do
    it 'should have all attr readers' do
      expect(whitelist).to respond_to :commands
    end
  end

  describe '.commands' do
    it 'should return a populated array' do
      commands = whitelist.commands
      expect(commands.class).to eq Array
      expect(commands.empty?).to be_falsey
    end
  end
end
