@events.each do |event|
  json.set! event.id do
    json.extract! event, :id, :title, :image_url, :location, :date, :price, :categories, :lat, :lng
  end
end
