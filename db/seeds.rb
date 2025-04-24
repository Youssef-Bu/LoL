roles = Player::ROLES
5.times do |i|
  team = Team.create!(name: "Team#{i}")
  roles.each do |role|
    Player.create!(first_name: "P#{role}#{i}", last_name: "LOL", role:, team:)
  end
end

puts "Seed OK - #{Team.count} équipes, #{Player.count} joueurs"
