json.array!(@sections) do |section|
  json.extract! section, :id, :header, :article, :user_id, :order
  json.url section_url(section, format: :json)
end
