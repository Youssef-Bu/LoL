class ResultsController < ApplicationController
  before_action :set_result, only: %i[show edit update destroy]

  def index
    @results = Result.includes(:match).all
  end

  def show; end
  def new  ; @result = Result.new ; end
  def edit ; end

  def create
    @result = Result.new(result_params)
    if @result.save
      redirect_to @result, notice: "Résultat enregistré."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @result.update(result_params)
      redirect_to @result, notice: "Résultat mis à jour."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @result.destroy!
    redirect_to results_path, status: :see_other, notice: "Résultat supprimé."
  end

  private

  def set_result
    @result = Result.find(params[:id])
  end

  def result_params
    params.require(:result)
          .permit(:match_id, :winner_id, :loser_id, :draw, :score)
  end
end
