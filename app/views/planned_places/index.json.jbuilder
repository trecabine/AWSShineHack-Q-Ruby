json.array!(@planned_places) do |planned_place|
  json.extract! planned_place, :id, :visit_time, :place_id, :trip_id, :votes
  json.url planned_place_url(planned_place, format: :json)
end
