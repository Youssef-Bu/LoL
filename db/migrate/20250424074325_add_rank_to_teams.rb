class AddRankToTeams < ActiveRecord::Migration[8.0]
  def change
    add_column :teams, :rank, :integer
  end
end
