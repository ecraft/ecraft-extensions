require 'ecraft/extensions/mixins/hashable'

module Ecraft
  module Extensions
    module Mixins
      describe Hashable do
        let(:klass) {
          Class.new do
            include Hashable
          end
        }

        subject do
          klass.new
        end

        let(:array_test_data) {
          ['', '123', 1232, '1232  ']
        }

        let(:array_test_response) {
          ['', '123', 1232, '1232']
        }

        let(:object_test) {
          Struct.new(:foo) do
            def to_h
              { foo: foo.upcase }
            end
          end.new('bar')
        }

        let(:object_result) {
          { foo: 'BAR' }
        }

        describe '#to_h' do
          context 'when passing an Array of values' do
            it 'trims all instances' do
              result = subject.to_h(array_test_data)
              expect(result).to eq array_test_response
            end
          end

          context 'when passing an Array of Hashes' do
            let(:symbol_key_hash) do
              { foo: 'bar ' }
            end

            let(:string_key_hash) do
              { 'foo' => 'bar ' }
            end

            let(:stripped_symbol_key_hash) {
              { foo: 'bar' }
            }

            it 'trims and symbolizes all instances' do
              result = subject.to_h([symbol_key_hash, string_key_hash])
              expect(result).to eq [stripped_symbol_key_hash, stripped_symbol_key_hash]
            end
          end

          context 'when passing an Array of Structs' do
            it 'returns the expected result' do
              result = subject.to_h([object_test])
              expect(result).to eq [object_result]
            end
          end

          context 'when passing a Struct' do
            it 'calls the to_h metod' do
              result = subject.to_h(object_test)
              expect(result).to eq object_result
            end
          end

          context 'when passing a Hash' do
            let(:source_data) do
              {
                foo: 'bar ',
                bar: 'baz       '
              }
            end

            let(:expected_result) do
              {
                foo: 'bar',
                bar: 'baz'
              }
            end

            it 'strips whitespace from all values' do
              result = subject.to_h(source_data)
              expect(result).to eq expected_result
            end
          end

          context 'when passing a Hash with String keys' do
            let(:source_data) do
              { 'foo' => 'bar ' }
            end

            let(:expected_result) {
              { foo: 'bar' }
            }

            it 'strips whitespace from all values and symbolizes the keys' do
              result = subject.to_h(source_data)
              expect(result).to eq expected_result
            end
          end

          context 'when passing a Hash with Symbol keys' do
            let(:source_data) {
              { foo: 'bar ' }
            }

            let(:expected_result) {
              { foo: 'bar' }
            }

            it 'strips whitespace from all values' do
              result = subject.to_h(source_data)
              expect(result).to eq expected_result
            end
          end

          context 'when passing an OpenStruct' do
            let(:source_data) {
              OpenStruct.new(foo: 'bar')
            }

            let(:expected_result) {
              { foo: 'bar' }
            }

            it 'returns the expected result' do
              result = subject.to_h(source_data)
              expect(result).to eq expected_result
            end
          end

          context 'when passing an arbitrary object' do
            let(:source_data) {
              Class.new do
                def initialize
                  # Whitespace in values will be automatically trimmed even for PORO objects...
                  @foo = 'bar  '
                  @baz = 'zot'
                end
              end.new
            }

            let(:expected_result) {
              {
                # ...like this.
                foo: 'bar',
                baz: 'zot'
              }
            }

            it 'returns the expected result' do
              result = subject.to_h(source_data)
              expect(result).to eq expected_result
            end
          end
        end
      end
    end
  end
end
