class Hand
  attr_accessor :cards, :turns

  def initialize(deck)
    @turns = 0
    @cards = []
    deck.picks.each do |p|
      p.total.times do
        @cards << p.card.name
      end
    end
    shuffle
  end

  def peek
    cards.first
  end

  def increment
    self.turns += 1
  end

  def draw(count = 1, turn = true)
    increment if turn
    count -= 1
    cards.slice!(0..count)
  end

  def shuffle
    @cards.shuffle!
  end

  def pluck(name)
    idx = cards.index(name)
    card = cards.delete_at(idx)
    shuffle
    card
  end

  def roll
    (rand*20).floor + 1
  end
end