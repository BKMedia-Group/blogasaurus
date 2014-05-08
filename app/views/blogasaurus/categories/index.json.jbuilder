json.array!(@blog_categories) do |blog_category|
  json.extract! blog_category, :id, :title, :description
  json.url blog_category_url(blog_category, format: :json)
end
