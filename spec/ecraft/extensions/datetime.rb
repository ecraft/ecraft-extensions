require 'json'
require 'ecraft/extensions/datetime'

describe Date do
  describe '#to_json' do
    it 'should serialize the datetime in yyyy-mm-ddTHH:MM:SS+Z form' do
      json = { 'datetime' => DateTime.new(2000, 1, 1,20,30) }.to_json
      expect(json).to eq '{"datetime":"2000-01-01T20:30:00+00:00"}'
    end
  end
end
