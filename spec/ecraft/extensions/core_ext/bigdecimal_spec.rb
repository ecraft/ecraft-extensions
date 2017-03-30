require 'json'

require 'ecraft/extensions/core_ext/big_decimal'

describe BigDecimal do
  describe '#to_json' do
    it 'should serialize integral decimals without decimals' do
      json = { 'CompanyCode' => BigDecimal.new('12345') }.to_json

      expect(json).to eq '{"CompanyCode":12345}'
    end

    it 'should serialize non-integral decimals with the least number of decimals possible' do
      json = { 'CompanyCode' => BigDecimal.new('12345.6700000') }.to_json

      expect(json).to eq '{"CompanyCode":12345.67}'
    end
  end

  describe '#to_s' do
    context 'when called without parameters' do
      it 'should serialize integral decimals without decimals' do
        result = BigDecimal.new('12345').to_s

        expect(result).to eq '12345'
      end

      it 'should serialize non-integral decimals with the least number of decimals possible' do
        result = BigDecimal.new('12345.6700000').to_s

        expect(result).to eq '12345.67'
      end
    end

    context 'when called with parameter' do
      it 'delegates properly to the original method' do
        result = BigDecimal.new('123456.789').to_s('3F')

        expect(result).to eq '123 456.789'
      end
    end
  end
end
