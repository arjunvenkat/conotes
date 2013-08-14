json.array!(@tag_associations) do |tag_association|
  json.extract! tag_association, :note_id, :tag_id
  json.url tag_association_url(tag_association, format: :json)
end
