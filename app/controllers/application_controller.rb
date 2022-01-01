class ApplicationController < ActionController::Base
  before_action :completed

  def completed
    @done = Entity.unscoped.where(similar: true).count
  end
end
