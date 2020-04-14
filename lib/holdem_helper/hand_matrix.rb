require_relative 'holdem_helper'
require 'byebug'
require 'yaml'

module HoldemHelper
  # 13 x 13 Matrix of playing cards of a format:
  # AA   AKs  AQs  AJs...
  # AKo  KK   KQs  KJs...
  # AQo  KQo  QQ   QJs...
  # AJo  Kjo  QJo  JJ...

  # There's a minimum number of people away from the big blind you
  # want to be to start betting certain hands. With less people,
  # you'll bet more loosely. 
  class HandMatrix
    def playable_hand?(position, card1, card2)
      same_suit = card1.suit == card2.suit
      high_rank = [card1.rank, card2.rank].max
      low_rank = [card1.rank, card2.rank].min

      coordinate1 = 14 - high_rank
      coordinate2 = 14 - low_rank

      minimum_position = if same_suit
                           matrix[coordinate1][coordinate2]
                         else
                           matrix[coordinate2][coordinate1]
                         end

      position >= minimum_position
    end

    private

    def matrix
      initialize_matrix! unless @matrix
      @matrix
    end

    # a matrix of the minimum position at the table you need to be in order
    # to bet this hand. 13 x 13 comparing card combos, with same/offsuit dilieanted
    # along the diagonal (see screenshot in readme)
    def initialize_matrix!
      @matrix = config.map do |_hand, minimum_position|
        minimum_position
      end.each_slice(13).to_a
    end

    def config
      YAML.safe_load(File.read(config_file))
    end

    def config_file
      File.join(File.dirname(__FILE__), 'config/rfi_minimum_positions.yml')
    end
  end
end
