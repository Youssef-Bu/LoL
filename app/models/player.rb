class Player < ApplicationRecord
  belongs_to :team
  ROLES = %w[Top\ laner Jungler Mid\ laner ADC Support]            # liste blanche
  validates :role, inclusion: { in: ROLES }                        :contentReference[oaicite:2]{index=2}
end
