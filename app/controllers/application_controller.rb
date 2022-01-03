class ApplicationController < ActionController::Base
  before_action :counters

  def counters
    @done = Phrase.total
    @article = Phrase.where(similar: true).count
  end
end
