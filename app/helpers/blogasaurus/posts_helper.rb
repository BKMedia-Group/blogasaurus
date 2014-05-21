module Blogasaurus
  module PostsHelper
    def get_recent_posts(count = 3)
      Post.accessible_by(current_ability).limit count
    end
  end
end
