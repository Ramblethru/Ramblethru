json.array!(@discovers) do |discover|
  json.extract! discover, :id, :destination, :latitude, :longitude
  json.url discover_url(discover, format: :json)
end
