# coding: utf-8
$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'ndr_ui/version'

Gem::Specification.new do |spec|
  spec.name          = 'ndr_ui'
  spec.version       = NdrUi::VERSION
  spec.authors       = ['NDR Development Team']
  spec.email         = []
  spec.summary       = 'NDR UI Rails Engine'
  spec.description   = 'Provides Rails applications with additional support for the ' \
                       'Twitter Bootstrap UI framework'
  spec.homepage      = 'https://github.com/PublicHealthEngland/ndr_ui'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    fail 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files      = Dir['{app,config,db,lib,vendor}/**/*', 'LICENSE.txt', 'Rakefile', 'README.md']
  spec.test_files = Dir['test/**/*']

  spec.required_ruby_version = '>= 2.2.0'

  spec.add_dependency 'rails', '>= 4.2', '< 5.1'
  spec.add_dependency 'bootstrap-sass', '~> 3.3.6'
  spec.add_dependency 'sass-rails', '>= 3.2'
  spec.add_dependency 'jquery-rails', '~> 4.1.0'

  spec.add_development_dependency 'sqlite3'

  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'ndr_dev_support', '~> 2.0', '>= 2.0.2'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'mocha', '~> 1.1.0'
end
