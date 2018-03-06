# coding: utf-8

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ecraft/extensions/version'

Gem::Specification.new do |spec|
  spec.name          = 'ecraft-extensions'
  spec.version       = Ecraft::Extensions::VERSION
  spec.authors       = ['Tre Kronor']
  spec.email         = ['team.trekronor@ecraft.com']

  spec.summary       = 'eCraft Extensions'
  spec.description   = 'Extension methods for various Ruby classes'
  spec.homepage      = 'https://github.com/ecraft/ecraft-extensions'
  spec.licenses      = []

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'activesupport', '>= 4.0'
  spec.add_runtime_dependency 'json', '>= 1.8'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'coveralls'
  spec.add_development_dependency 'guard-rspec', '~> 4.7'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop', '~> 0.51'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'yard'
end
