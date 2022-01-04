# frozen_string_literal: true

module ApplicationHelper
  def color(article)
    case article
    when /^Der/ then 'style="color: red;"'
    when /^Die/ then 'style="color: #004dff"'
    when /^Das/ then 'style="color: green;"'
    end
  end

  def without_article(word, category)
    return word unless category

    word
    # word.gsub(/the |der |die |das /, '')
  end
end
