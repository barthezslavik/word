# frozen_string_literal: true

class Entity < ApplicationRecord
  ARTICLES = %w[Der Die Das].freeze
  TAKE = 20
  ANSWERS = 5

  def done?
    done_article && done_german
  end
end
