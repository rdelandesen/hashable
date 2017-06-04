$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'hashable/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'hashable'
  s.version     = Hashable::VERSION
  s.authors     = ['Romain de Landesen']
  s.email       = %w(rdelandesen@gmail.com)
  s.homepage    = 'https://github.com/rdelandesen/hashable'
  s.summary     = 'Hashable allows you to generate and save hash id'
  s.description = 'Hashable allows you to generate and save hash id'
  s.license     = 'MIT'

  s.files = Dir["{app,config,db,lib}/**/*", 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.required_ruby_version = '>= 1.9.3'
  s.add_dependency 'rails', '~> 5.1.1'
  s.add_dependency 'hashids'

  s.add_development_dependency 'sqlite3'
end
