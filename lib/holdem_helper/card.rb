require_relative 'holdem_helper'

module HoldemHelper
  # Playing Card
  class Card
    attr_reader :rank, :suit

    def initialize(rank:, suit:)
      raise ArgumentError unless HoldemHelper.ranks.include?(rank)
      raise ArgumentError unless HoldemHelper.suits.include?(suit.to_sym)

      @rank = rank
      @suit = suit
    end
  end
end
