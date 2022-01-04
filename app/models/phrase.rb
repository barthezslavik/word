class Phrase < ApplicationRecord
  TAKE = 20
  ANSWERS = 3
  TRUNCATE_LEFT = 35
  TRUNCATE = 35

  class << self
    def total
      Phrase.count - where(similar: true).count
    end

    def noun
      where(category: 'noun', similar: [nil, false]).count
    end

    def verb
      where(category: 'verb', similar: [nil, false]).count
    end

    def mixed
      where(category: 'mixed', similar: [nil, false]).count
    end

    def question
      where(category: 'question', similar: [nil, false]).count
    end

    def action
      where(category: 'action', similar: [nil, false]).count
    end

    def sentence
      where(category: 'sentence', similar: [nil, false]).count
    end

    def skip
      where(category: 'skip', similar: [nil, false]).count
    end
  end
end
