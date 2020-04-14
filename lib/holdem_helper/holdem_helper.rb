module HoldemHelper
  VERSION = 0.1

  # Suits
  JACK  = 11
  QUEEN = 12
  KING  = 13
  ACE   = 14

  def self.suits
    @suits ||= %i[clubs diamonds hearts spades].freeze
  end

  def self.ranks
    @ranks ||= [2, 3, 4, 5, 6, 7, 8, 9, 10, JACK, QUEEN, KING, ACE].freeze
  end

  # Positions at the table in relation to Big Blind, assuming 9 player game
  BIG_BLIND = 0
  UNDER_THE_GUN = 1
  UNDER_THE_GUN_1 = 2
  UNDER_THE_GUN_2 = 3
  LOWJACK = 4
  HIGHJACK = 5
  CUTOFF = 6
  BUTTON = 7
  SMALL_BLIND = 8

  # For games with less than 9 people, start using minimum position at a later
  # point to encourage looser play
  def self.positions
    [
      BIG_BLIND,
      UNDER_THE_GUN,
      UNDER_THE_GUN_1,
      UNDER_THE_GUN_2,
      LOWJACK,
      HIGHJACK,
      CUTOFF,
      BUTTON,
      SMALL_BLIND
    ]
  end

  def self.rank_input
    {
      '2' => 2,
      '3' => 3,
      '4' => 4,
      '5' => 5,
      '6' => 6,
      '7' => 7,
      '8' => 8,
      '9' => 9,
      't' => 10,
      'j' => HoldemHelper::JACK,
      'q' => HoldemHelper::QUEEN,
      'k' => HoldemHelper::KING,
      'a' => HoldemHelper::ACE
    }
  end

  def self.suit_input
    {
      's' => :spades,
      'c' => :clubs,
      'h' => :hearts,
      'd' => :diamonds
    }
  end
end
