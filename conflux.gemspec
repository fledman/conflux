# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'conflux/version'

Gem::Specification.new do |spec|
  spec.name          = "conflux"
  spec.version       = Conflux::VERSION
  spec.authors       = ["David Feldman"]
  spec.email         = ["dbfeldman@gmail.com"]

  spec.summary       = "Flow control for batch operations"
  spec.description   = "Conflux provides better flow control for batch operations"
  spec.homepage      = "https://github.com/fledman/conflux"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.4"
  spec.add_development_dependency "pry", "~>0.10"
end
