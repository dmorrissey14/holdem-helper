# frozen_string_literal: true

require 'spec_helper'

RSpec.describe HoldemHelper::HandMatrix do
  let(:matrix) { HoldemHelper::HandMatrix.new }

  describe '#playable_card?' do
    it 'should be playable with an always playable hand' do
      card1 = HoldemHelper::Card.new(rank: HoldemHelper::ACE, suit: :spades)
      card2 = HoldemHelper::Card.new(rank: HoldemHelper::KING, suit: :spades)
      playable = matrix.playable_hand?(HoldemHelper::UNDER_THE_GUN, card1, card2)
      expect(playable).to be true
    end

    it 'should not be playable with A9s as under the gun' do
      card1 = HoldemHelper::Card.new(rank: HoldemHelper::ACE, suit: :spades)
      card2 = HoldemHelper::Card.new(rank: 9, suit: :spades)
      playable = matrix.playable_hand?(HoldemHelper::UNDER_THE_GUN, card1, card2)
      expect(playable).to be false
    end

    it 'should be playable with A9s as under the gun+2' do
      card1 = HoldemHelper::Card.new(rank: HoldemHelper::ACE, suit: :spades)
      card2 = HoldemHelper::Card.new(rank: 9, suit: :spades)
      playable = matrix.playable_hand?(HoldemHelper::UNDER_THE_GUN_2, card1, card2)
      expect(playable).to be true
    end

    it 'should be playable with a9s, UTG+2, in reverse order' do
      card1 = HoldemHelper::Card.new(rank: 9, suit: :spades)
      card2 = HoldemHelper::Card.new(rank: HoldemHelper::ACE, suit: :spades)
      playable = matrix.playable_hand?(HoldemHelper::UNDER_THE_GUN_2, card1, card2)
      expect(playable).to be true
    end
  end
end
