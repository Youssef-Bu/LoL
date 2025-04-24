class HomeController < ApplicationController
  def index
    @recent_matches = Match.includes(:team_a, :team_b).recent
  end
end
