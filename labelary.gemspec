# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'labelary/version'

Gem::Specification.new do |spec|
  spec.name          = 'labelary'
  spec.version       = Labelary::VERSION
  spec.authors       = ['Robert Coleman']
  spec.email         = ['github@robert.net.nz']

  spec.summary       = 'Ruby Gem to interact with the Labelary.com ZPL Web Service'
  spec.description   = 'Ruby Gem to interact with the Labelary.com ZPL Web Service'
  spec.homepage      = 'https://github.com/rjocoleman/labelary'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2'
  spec.add_development_dependency 'pry', '~> 0.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rubocop', '~> 0.80'

  spec.add_dependency 'activesupport', '>= 5'
  spec.add_dependency 'faraday', '>= 0.9', '< 2'
  spec.add_dependency 'faraday_middleware', '>= 0.10', '< 2'
end
