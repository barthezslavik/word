class Entity < ApplicationRecord
  def done?
    done_article && done_german
  end
end
