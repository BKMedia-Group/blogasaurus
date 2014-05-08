module Blogasaurus
  class ApplicationController < ::ApplicationController
    def current_ability
      @current_ability ||= Blogasaurus::Ability.new(current_user)
    end
  end
end
