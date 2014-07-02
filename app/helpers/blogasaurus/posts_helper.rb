module Blogasaurus
  module PostsHelper
    def get_recent_posts(count = 3)
      Post.accessible_by(current_ability).limit count
    end
    def get_posts_grouped_by_year
      Post.accessible_by(current_ability).group_by do |p|
        p.created_at.beginning_of_year
      end
    end
    def get_posts_grouped_by_month
      Post.accessible_by(current_ability).group_by do |p|
        p.created_at.beginning_of_month
      end
    end
  end
end
