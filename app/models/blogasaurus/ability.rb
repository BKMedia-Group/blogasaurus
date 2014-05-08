module Blogasaurus
  class Ability
    include CanCan::Ability

    def initialize(user)
      user ||= User.new # guest user (not logged in)
      if user.try :admin?
        can :manage, :all
      else
        can :read, :all
      end
    end
  end
end
