json.array!(@places) do |place|
  json.extract! place, :id, :name, :type, :created_by, :price
  json.url place_url(place, format: :json)
end
