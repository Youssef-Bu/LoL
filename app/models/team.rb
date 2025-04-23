class Team < ApplicationRecord
    has_many :players,  dependent: :destroy
    has_many :home_matches, class_name: "Match", foreign_key: :team_a_id
    has_many :away_matches, class_name: "Match", foreign_key: :team_b_id
  
    validates :name, presence: true, uniqueness: true
    validate  :max_five_players
  
    # bonus classement
    def self.ranked
      order(points: :desc, name: :asc)
    end
  
    private
    def max_five_players
      errors.add(:base, "Pas plus de 5 joueurs") if players.size > 5
    end
  end
  