module Blogasaurus
  class Ability
    include CanCan::Ability

    def initialize(user)
      user ||= User.new # guest user (not logged in)
      if user.try :admin?
        can :manage, :all
      else
        can :show, [Category, Tag, Author]
        can :read, Post, ['blogasaurus_posts.published = ? AND blogasaurus_posts.category_id IS NOT NULL AND blogasaurus_posts.created_at < ?', true, Time.now] do |post|
          post.created_at <= Time.now and post.category != nil
        end
      end
    end
  end
end
