$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'rails_livejs/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'rails_livejs'
  s.version     = RailsLivejs::VERSION
  s.authors     = ['Michael Sprauer']
  s.email       = ['Sprauer@Inline.de']
  s.homepage    = 'https://www.inline.de'
  s.summary     = 'Update any ActiveRecord value as it gets updated in the database.'
  s.description = 'Update any ActiveRecord value as it gets updated in the database.'
  s.license     = 'MIT'

  s.files = Dir['{app,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails'
  s.add_dependency 'websocket-rails'
end
