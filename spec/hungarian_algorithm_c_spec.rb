require_relative './spec_helper'
require_relative '../lib/hungarian_algorithm_c'

RSpec.describe HungarianAlgorithmC do
  describe '.find_pairings' do
    subject { described_class.find_pairings(matrix_with_costs) }

    context 'unbalanced array / non-square matrix' do
      let(:matrix_with_costs) { [1, 2] }

      it 'raises ArgumentError' do
        expect { subject }.to raise_error(ArgumentError)
      end
    end

    context '2x2 array' do
      let(:matrix_with_costs) { [
        [4, 3],
        [3, 0]
      ] }

      it 'should output minimum cost pairs' do
        should match_array([
          [1, 1],
          [0, 0]
        ])
      end
    end

    context '3x3 array' do
      let(:matrix_with_costs) { [
        [2, 3, 3],
        [3, 3, 2],
        [3, 2, 3]
      ] }

      it 'should output minimum cost pairs' do
        should match_array([
          [0, 0],
          [1, 2],
          [2, 1]
        ])
      end

      context 'with very large numbers' do
        let(:matrix_with_costs) { [
          [4, 1, 7],
          [Float::INFINITY, 3, 9],
          [1, 2, 13]
        ] }

        it 'should output minimum cost pairs' do
          should match_array([
            [0, 2],
            [1, 0],
            [2, 1]
          ])
        end
      end
    end

    context '4x4 array' do
      let(:matrix_with_costs) { [
        [2, 3, 1, 3],
        [10, 2, 90, 6],
        [10, 3, 34, 4],
        [11, 13, 15, 17]
      ] }

      it 'should output minimum cost pairs' do
        should match_array([
          [0, 2],
          [1, 1],
          [2, 3],
          [3, 0]
        ])
      end

      context 'with very large numbers' do
        let(:matrix_with_costs) { [
          [Float::INFINITY, 3, 10000000000000000000000000000000000, 3],
          [10, 2, Float::INFINITY, 6],
          [10, 3, 34, Float::INFINITY],
          [99999999999999999999999, 13, 15, 6000000000000000]
        ] }

        it 'should output minimum cost pairs' do
          should match_array([
            [0, 2],
            [1, 1],
            [2, 3],
            [3, 0]
          ])
        end
      end
    end
  end
end
