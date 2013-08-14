json.array!(@votes) do |vote|
  json.extract! vote, :voteable_id, :voteable_type
  json.url vote_url(vote, format: :json)
end
