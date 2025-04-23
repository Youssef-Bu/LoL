class Result < ApplicationRecord
  belongs_to :match
  belongs_to :winner, class_name: "Team", optional: true
  belongs_to :loser,  class_name: "Team", optional: true

  validate :winner_or_draw

  after_save :update_team_points   # bonus classement

  private
  def winner_or_draw
    if draw && (winner_id || loser_id)
      errors.add(:base, "Pas de vainqueur/perdant si match nul")
    elsif !draw && !(winner_id && loser_id)
      errors.add(:base, "Précise vainqueur ET perdant")
    end
  end

  def update_team_points
    return unless saved_change_to_attribute?(:id) || saved_change_to_attribute?(:winner_id)
    if draw
      match.team_a.increment!(:points)
      match.team_b.increment!(:points)
    else
      winner.increment!(:points, 3)
    end
  end
end
