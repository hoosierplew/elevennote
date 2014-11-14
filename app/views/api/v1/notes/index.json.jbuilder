json.array!(@notes) do |note|
  json.id note.id
  json.title note.title
  json.url api_v1_note_url(note, format: :json, api_key: params[:api_key])
end
