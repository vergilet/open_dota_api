$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'open_dota_api/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'open_dota_api'
  s.version     = OpenDotaApi::VERSION
  s.authors     = ['Yaroslav Oslavskiy']
  s.email       = ['osyaroslav@gmail.com.com']
  s.homepage    = 'https://github.com/vergilet/open-dota-api'
  s.summary     = 'Ruby wrapper for Open Dota API'
  s.description = 'Ruby wrapper for Open Dota API'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['spec/**/*']

  s.add_dependency 'httparty'
  s.add_dependency 'hashable'

  s.add_development_dependency 'listen'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'webmock'
  s.add_development_dependency 'faker'
  s.add_development_dependency 'simplecov'
end
