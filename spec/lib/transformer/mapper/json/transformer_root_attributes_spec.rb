# frozen_string_literal: true

module Transformer
  module Mapper
    RSpec.describe Json do
      subject(:transformer) { described_class.transform json: json, mapping: mapping }

      context 'with a json file with a set of root-level keys' do
        let(:json)    { source[:data] }
        let(:mapping) { source[:mapping] }
        let(:source)  { fixture 'root_keys' }

        it 'extracts all the root-level keys specified' do
          expect(transformer).to(
            include(birth_date: 'June 1, 1964') &&
            include(first_name: 'Martin') &&
            include(last_name: 'Streicher')
          )
        end

        it 'ignores root-level keys not specified' do
          expect(transformer).not_to include(:city)
        end
      end
    end
  end
end
