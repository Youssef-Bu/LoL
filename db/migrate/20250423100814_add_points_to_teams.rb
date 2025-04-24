class AddPointsToTeams < ActiveRecord::Migration[8.0]
  def change
    add_column :teams, :points, :integer
  end
end
