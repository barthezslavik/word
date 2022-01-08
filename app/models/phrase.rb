class Phrase < ApplicationRecord
  TAKE = 20
  ANSWERS = 4
  TRUNCATE_LEFT = 25
  TRUNCATE = 25

  class << self
    def progress
      where(similar: [nil, false])
    end

    def total
      Phrase.count - where(similar: true).count
    end

    def noun
      progress.where(category: 'noun').count
    end

    def verb
      progress.where(category: 'verb').count
    end

    def mixed
      progress.where(category: 'mixed').count
    end

    def capital
      progress.where(category: 'capital').count
    end

    def question
      progress.where(category: 'question').count
    end

    def action
      progress.where(category: 'action').count
    end

    def sentence
      progress.where(category: 'sentence').count
    end

    def skip
      progress.where(category: 'skip').count
    end
  end
end
