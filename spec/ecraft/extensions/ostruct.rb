require 'json'
require 'ecraft/extensions/ostruct'

describe OpenStruct do
  describe '#to_json' do
    it 'should serialize the object to {"person":{"name":"Albin Cat","age":12}}' do
      person = OpenStruct.new
      person.name = 'Albin Cat'
      person.age = 12
      json = { 'person' => person }.to_json
      expect(json).to eq '{"person":{"name":"Albin Cat","age":12}}'
    end
  end
end
