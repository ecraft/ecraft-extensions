require 'json'
require 'ecraft/extensions/time'

describe Time do
  # More details: https://en.wikipedia.org/wiki/ISO_8601
  describe '#to_json' do
    context 'serializes the date and time in ISO 8601 form' do
      context 'with a fraction part' do
        it 'renders the milliseconds part' do
          json = { 'time' => Time.new(2000, 1, 1, 1, 2, 3.399, '+02:00') }.to_json
          expect(json).to eq '{"time":"2000-01-01T01:02:03.399+02:00"}'
        end
      end

      context 'without a fraction part' do
        it 'renders no milliseconds' do
          json = { 'time' => Time.new(2000, 1, 1, 0, 0, 0, '+02:00') }.to_json
          expect(json).to eq '{"time":"2000-01-01T00:00:00+02:00"}'
        end
      end
    end
  end

  describe '#as_ms' do
    it 'should convert time to ms' do
      ms = Time.new(2000, 1, 1, 0, 0, 0, '+02:00').as_ms
      expect(ms).to eq 946_677_600_000
    end
  end
end
