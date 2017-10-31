require 'json'
require 'ecraft/extensions/time'

describe Date do
  # More details: https://en.wikipedia.org/wiki/ISO_8601
  describe '#to_json' do
    context 'for values without a fraction part' do
      it 'serializes the date and time in ISO 8601 form, not including a fraction part' do
        json = { 'time' => Time.new(2000, 1, 1) }.to_json
        expect(json).to eq '{"time":"2000-01-01T00:00:00+02:00"}'
      end
    end

    context 'for values with a fraction part' do
      it 'serializes the date and time in ISO 8601 form, including the fraction part' do
        json = { 'time' => Time.new(2000, 1, 1, 1, 2, 3.399) }.to_json
        expect(json).to eq '{"time":"2000-01-01T01:02:03.399+02:00"}'
      end
    end
  end

  describe '#as_ms' do
    it 'should convert time to ms' do
      ms = Time.new(2000, 1, 1).as_ms
      expect(ms).to eq 946_677_600_000
    end
  end
end
