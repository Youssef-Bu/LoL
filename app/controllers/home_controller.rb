class HomeController < ApplicationController
  def index
    @recent_matches = Match
                        .includes(:team_a, :team_b, :result)
                        .order(played_at: :desc)
                        .limit(5)
  end
end
