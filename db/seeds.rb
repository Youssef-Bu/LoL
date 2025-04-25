puts "💾  Réinitialisation…"
Player.destroy_all
Match.destroy_all
Team.destroy_all

roles = ["Top laner", "Jungler", "Mid laner", "ADC", "Support"]

3.times do |i|
  team = Team.create!(name: "Team #{i + 1}")

  roles.each_with_index do |role, j|
    Player.create!(
      first_name: "Player#{i + 1}#{j + 1}",
      last_name:  "LOL",
      role:       role,
      team:       team
    )
  end
end

team_a, team_b, team_c = Team.all

m1 = Match.create!(team_a:, team_b:, played_at: 2.days.ago)
m2 = Match.create!(team_a: team_b, team_b: team_c, played_at: 1.day.ago)

Result.create!(match: m1, winner_id: team_a.id, loser_id: team_b.id,
               draw: false, score: "1-0")
Result.create!(match: m2, winner_id: team_c.id, loser_id: team_b.id,
               draw: false, score: "1-0")

puts "✅  Seed terminé !"
puts "   Équipes : #{Team.count}"
puts "   Joueurs : #{Player.count}"
puts "   Matchs  : #{Match.count}"
