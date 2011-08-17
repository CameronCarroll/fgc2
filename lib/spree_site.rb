require 'spree_core'
require 'site_hooks'


module SpreeSite
  class Engine < Rails::Engine
    def self.activate
      Calculator::FlatRate2.register
    end
    
    def load_tasks
    end
    
    config.to_prepare &method(:activate).to_proc
  end
end