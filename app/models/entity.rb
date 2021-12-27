# frozen_string_literal: true

class Entity < ApplicationRecord
  ARTICLES = %w[Der Die Das].freeze

  def done?
    done_article && done_german
  end
end
