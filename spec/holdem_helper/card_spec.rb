# frozen_string_literal: true

require 'spec_helper'

RSpec.describe HoldemHelper::Card do
  describe '#initialize' do
    it 'should instantiate with valid rank' do
      (2..HoldemHelper::ACE).each do |rank|
        card = HoldemHelper::Card.new(rank: rank, suit: :spades)
        expect(card.class).to eq(HoldemHelper::Card)
      end
    end

    it 'should not instantiate with invalid rank' do
      expect {
        HoldemHelper::Card.new(rank: 15, suit: :spades)
      }.to raise_error(ArgumentError)
      expect {
        HoldemHelper::Card.new(rank: 1, suit: :spades)
      }.to raise_error(ArgumentError)
    end

    it 'should instantiate with valid suit' do
      HoldemHelper.suits.each do |suit|
        card = HoldemHelper::Card.new(rank: 2, suit: suit)
        expect(card.class).to eq(HoldemHelper::Card)
      end
    end

    it 'should not instantiate with invalid suit' do
      expect{
        HoldemHelper::Card.new(rank: 2, suit: :foo)
      }.to raise_error(ArgumentError)
    end
  end
end
