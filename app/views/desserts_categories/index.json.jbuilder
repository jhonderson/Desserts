json.array!(@desserts_categories) do |desserts_category|
  json.extract! desserts_category, :id, :name, :image_url
  json.url desserts_category_url(desserts_category, format: :json)
end
