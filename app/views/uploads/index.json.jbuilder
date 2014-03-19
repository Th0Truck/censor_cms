json.array!(@uploads) do |upload|
  json.extract! upload, :id, :name, :title, :size, :type
  json.url upload_url(upload, format: :json)
end
