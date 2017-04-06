require 'json'
require 'ecraft/extensions/date'

describe Date do
  describe '#to_json' do
    it 'should serialize the date in yyyy-mm-dd form' do
      person = OpenStruct.new
      person.name = 'Albin Cat'
      person.age = 12
      json = { 'person' => person }.to_json
      expect(json).to eq '{"person":"2000-01-01"}'
    end
  end
end
