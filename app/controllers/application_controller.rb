class ApplicationController < ActionController::Base
  before_action :counters

  def counters
    @done = Entity.where(similar: [false, nil]).count
    @article = Entity.where(done_article: true, article: Entity::ARTICLES, similar: true).count
  end
end
