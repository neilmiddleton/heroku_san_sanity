require 'rails'

module HerokuSanSanity
  class Railtie < Rails::Railtie
    rake_tasks do
      load File.join(File.dirname(__FILE__), 'tasks.rb')
    end
  end
end