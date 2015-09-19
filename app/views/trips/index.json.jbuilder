json.array!(@trips) do |trip|
  json.extract! trip, :id, :name, :created_by, :modified_by, :image_url
  json.url trip_url(trip, format: :json)
end
