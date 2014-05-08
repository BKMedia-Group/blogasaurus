json.array!(@blogs) do |blog|
  json.extract! blog, :id, :intro_text, :full_text, :author_id, :blog_category_id, :image, :title
  json.url blog_url(blog, format: :json)
end
