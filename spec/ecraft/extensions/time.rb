require 'json'
require 'ecraft/extensions/time'

describe Date do
  describe '#to_json' do
    it 'should serialize the time in yyyy-mm-ddTHH:MM:SS+Z form' do
      json = { 'time' => Time.new(2000, 1, 1) }.to_json
      expect(json).to eq '{\"time\":\"2000-01-01T00:00:00+02:00\"}'
    end
  end

  describe '#as_ms' do
    it 'should convert time to ms' do
      ms = Time.new(2000, 1, 1).as_ms
      expect(ms).to eq 946_677_600_000
    end
  end
end
