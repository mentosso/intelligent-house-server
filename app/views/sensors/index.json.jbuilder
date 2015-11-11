json.array!(@sensors) do |sensor|
  json.extract! sensor, :id
  json.url sensor_url(sensor, format: :json)
end
