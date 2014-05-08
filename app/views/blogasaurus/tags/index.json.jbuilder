json.array!(@blog_tags) do |blog_tag|
  json.extract! blog_tag, :id, :title
  json.url blog_tag_url(blog_tag, format: :json)
end
