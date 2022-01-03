class Phrase < ApplicationRecord
  TAKE = 20
  ANSWERS = 5
  TRUNCATE_LEFT = 35
  TRUNCATE = 20

  class << self
    def total
      Phrase.count - where(similar: true).count
    end
  end
end
