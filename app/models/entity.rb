# frozen_string_literal: true

class Entity < ApplicationRecord
  ARTICLES = %w[Der Die Das].freeze
  TAKE = 40
  ANSWERS = 3

  def done?
    done_article && done_german
  end
end
