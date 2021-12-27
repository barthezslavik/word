class ApplicationController < ActionController::Base
  before_action :completed

  def completed
    @done = Entity.count - Entity.where(done_article: true, done_german: true).count
  end
end
