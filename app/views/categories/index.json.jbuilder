json.array!(@categories) do |category|
  json.extract! category, :id, :name, :address
  json.url category_url(category, format: :json)
end
