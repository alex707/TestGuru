class BadgesController < ApplicationController
  def index
    @badges = Badge.all
  end

  def my
    @badges = Award.all.where(user: 1).map(&:badge)
  end
end
