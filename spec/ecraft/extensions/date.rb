require 'json'

require 'ecraft/extensions/date'

describe Date do
  describe '#to_json' do
    it 'should serialize integral decimals without decimals' do
      json = { 'date' => Date.new(2000, 1, 1) }.to_json
      puts json
      expect(json).to eq '{"date":"2000-01-01"}'
    end
  end
end
