class MatchesController < ApplicationController
  before_action :set_match, only: %i[show edit update destroy]

  def index
    @matches = Match.includes(:team_a, :team_b).all
  end

  def show; end
  def new ; @match = Match.new ; end
  def edit; end

  def create
    @match = Match.new(match_params)
    if @match.save
      redirect_to @match, notice: "Match créé."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @match.update(match_params)
      redirect_to @match, notice: "Match mis à jour."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @match.destroy!
    redirect_to matches_path, status: :see_other, notice: "Match supprimé."
  end

  private

  def set_match
    @match = Match.find(params[:id])
  end

  def match_params
    params.require(:match).permit(:team_a_id, :team_b_id, :played_at)
  end
end
