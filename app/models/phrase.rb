class Phrase < ApplicationRecord
  TAKE = 20
  ANSWERS = 3

  class << self
    def total
      Phrase.count - where(similar: true).count
    end
  end
end
