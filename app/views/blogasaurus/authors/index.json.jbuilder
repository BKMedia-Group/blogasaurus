json.array!(@blog_authors) do |blog_author|
  json.extract! blog_author, :id, :title, :photo, :bio
  json.url blog_author_url(blog_author, format: :json)
end
