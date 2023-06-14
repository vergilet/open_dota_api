$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'open_dota_api/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'open_dota_api'
  s.version     = OpenDotaApi::VERSION
  s.authors     = ['YaroslavO']
  s.email       = ['osyaroslav@gmail.com']
  s.homepage    = 'https://github.com/vergilet/open_dota_api'
  s.summary     = 'Ruby wrapper for Open Dota API'
  s.description = 'Unofficial Ruby Library for OpenDotaAPI. This API provides Dota 2 related data.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['spec/**/*']

  s.add_dependency 'hashable', '~> 0.1.2'
  s.add_dependency 'httparty', '>= 0.20', '< 0.22'

  s.add_development_dependency 'listen', '~> 3.7'
  s.add_development_dependency 'rake', '~> 13.0'
  s.add_development_dependency 'rspec', '~> 3.11'
  s.add_development_dependency 'simplecov', '~> 0.21'
  s.add_development_dependency 'webmock', '~> 3.14'
end
