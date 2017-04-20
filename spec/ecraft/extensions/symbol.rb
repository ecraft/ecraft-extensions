require 'json'
require 'ecraft/extensions/symbol'

describe Symbol do
  describe '#to_json' do
    it 'should serialize symbol as "\"foo\""' do
      json = :foo.to_json
      expect(json).to eq '"foo"'
    end
  end
end
