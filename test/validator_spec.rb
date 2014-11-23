require_relative '../lib/validator.rb'
require_relative '../lib/whitelist.rb'


describe Terminal::Validator do

  let(:validator) { Terminal::Validator.new Terminal::WhiteList.commands }

  describe 'attr' do
    it 'should have all attr readers' do
      expect(validator).to respond_to :commands
    end

    it 'should have all attr writers' do
      expect(validator).to respond_to :commands=
    end
  end

  describe '.initialize' do
    it 'should exist' do
      expect(validator).to be_truthy
    end
  end
end
