json.array!(@notes) do |note|
  json.extract! note, :contents
  json.url note_url(note, format: :json)
end
