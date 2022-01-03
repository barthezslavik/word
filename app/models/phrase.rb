class Phrase < ApplicationRecord
  TAKE = 20
  ANSWERS = 4
  TRUNCATE = 30

  class << self
    def total
      Phrase.count - where(similar: true).count
    end
  end
end
