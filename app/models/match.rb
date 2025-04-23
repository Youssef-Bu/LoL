class Match < ApplicationRecord
  belongs_to :team_a, class_name: "Team"
  belongs_to :team_b, class_name: "Team"
  has_one    :result, dependent: :destroy

  validates :team_a, :team_b, presence: true
  validate  :distinct_teams

  scope :recent, -> { order(played_at: :desc).limit(5) }

  private
  def distinct_teams
    errors.add(:team_b, "doit être différente") if team_a_id == team_b_id
  end
end
