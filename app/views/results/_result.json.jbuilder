json.extract! result, :id, :match_id, :winner_id, :loser_id, :draw, :score, :created_at, :updated_at
json.url result_url(result, format: :json)
