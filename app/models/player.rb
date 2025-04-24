class Player < ApplicationRecord
  belongs_to :team
  validates  :team, presence: true

  ROLES = [
    "Top laner",
    "Jungler",
    "Mid laner",
    "ADC",
    "Support"
  ]

  validates :role, inclusion: { in: ROLES }
end
