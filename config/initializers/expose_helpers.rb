module Blogasaurus
  class Engine < Rails::Engine
    initializer 'blogasaurus.action_controller' do |app|
      ActiveSupport.on_load :action_controller do
        helper Blogasaurus::PostsHelper
      end
    end
  end
end
