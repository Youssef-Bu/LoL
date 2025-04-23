class PlayersController < ApplicationController
  before_action :set_player, only: %i[show edit update destroy]

  # GET /players
  def index
    @players = Player.all
  end

  # GET /players/1
  def show; end

  # GET /players/new
  def new
    @player = Player.new
  end

  # GET /players/1/edit
  def edit; end

  # POST /players
  def create
    @player = Player.new(player_params)

    if @player.save
      redirect_to @player, notice: "Le joueur a bien été créé."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /players/1
  def update
    if @player.update(player_params)
      redirect_to @player, notice: "Le joueur a bien été mis à jour."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /players/1
  def destroy
    @player.destroy!
    redirect_to players_path, notice: "Le joueur a bien été supprimé.", status: :see_other
  end

  private

  # callback
  def set_player
    @player = Player.find(params[:id])
  end

  # strong parameters
  def player_params
    params.require(:player).permit(:first_name, :last_name, :role, :team_id)
  end
end
