json.array!(@comments) do |comment|
  json.extract! comment, :id, :content, :product_id, :image, :user_id, :status
  json.url comment_url(comment, format: :json)
end
