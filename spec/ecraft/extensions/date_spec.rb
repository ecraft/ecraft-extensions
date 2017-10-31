require 'json/add/core'
require 'ecraft/extensions/date'

describe Date do
  describe '#to_json' do
    it 'should serialize the date in yyyy-mm-dd form' do
      json = { 'date' => Date.new(2000, 1, 1) }.to_json
      expect(json).to eq '{"date":"2000-01-01"}'
    end
  end
end
