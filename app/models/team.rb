class Team < ApplicationRecord
  has_many :players, dependent: :destroy
  validates :name, presence: true, uniqueness: true

  validate :max_five_players

  private

  def max_five_players
    errors.add(:base, "Pas plus de 5 joueurs") if players.size > 5
  end
end
