require 'json'
require 'ecraft/extensions/string'

describe String do
  describe '#to_snake_case' do
    it 'should snake case a string' do
      snake_case_string = 'FooBar'.to_snake_case
      expect(snake_case_string).to eq 'foo_bar'
    end
  end

  describe '#to_bool' do
    it 'should convert a string to boolean' do
      bool = 'true'.to_bool
      expect(bool).to eq true
    end
  end
end
