require 'json'
require 'ecraft/extensions/string'

describe String do
  describe '#to_camelcase' do
    it 'should camelcase a string' do
      camelcase_string = 'foo_bar'.to_camelcase
      expect(camelcase_string).to eq 'FooBar'
    end
  end

  describe '#to_snake_case' do
    it 'should snake case a string' do
      snake_case_string = 'FooBar'.to_snake_case
      expect(snake_case_string).to eq 'foo_bar'
    end
  end

  describe '#to_class' do
    it 'it should convert a string to the corresponding Class or Module' do
      class FooBar
      end
      expect('FooBar'.to_class).not_to eq nil
    end
  end

  describe '#to_bool' do
    it 'should convert a string to boolean' do
      bool = 'true'.to_bool
      expect(bool).to eq true
    end
  end
end
