class TeamsController < ApplicationController
  before_action :set_team, only: %i[show edit update destroy]

  def index
    @teams = Team.all
  end

  def show; end
  def new  ; @team = Team.new ; end
  def edit ; end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to @team, notice: "Équipe créée avec succès."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @team.update(team_params)
      redirect_to @team, notice: "Équipe mise à jour."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @team.destroy!
    redirect_to teams_path, status: :see_other, notice: "Équipe supprimée."
  end

  private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name)
  end
end
