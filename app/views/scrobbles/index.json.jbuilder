json.array!(@scrobbles) do |scrobble|
  json.extract! scrobble, :id, :time, :trackname, :artistname, :albumname, :application
  json.url scrobble_url(scrobble, format: :json)
end
