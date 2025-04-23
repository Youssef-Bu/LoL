class Player < ApplicationRecord
  belongs_to :team
  ROLES = %w[Top\ laner Jungler Mid\ laner ADC Support]
  validates :role, inclusion: { in: ROLES }
end