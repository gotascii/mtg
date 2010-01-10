class Hand
  attr_accessor :library, :turns

  def initialize(deck)
    @turns = 0
    @library = deck.library
    shuffle
  end

  def peek
    library.first
  end

  def increment
    self.turns += 1
  end

  def draw(count = 1, turn = true)
    increment if turn
    count -= 1
    library.slice!(0..count)
  end

  def shuffle(cards = [])
    cards = cards.to_a
    self.library += cards
    library.shuffle!
  end

  def tutor(names)
    names = names.to_a
    names.collect do |name|
      idx = library.index(name)
      card = idx.nil? ? nil : library.delete_at(idx)
      shuffle
      card
    end
  end

  def roll
    (rand*20).floor + 1
  end
end