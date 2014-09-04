# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'quipper/mixpanel/exporter/version'

Gem::Specification.new do |spec|
  spec.name          = "quipper-mixpanel-exporter"
  spec.version       = Quipper::Mixpanel::Exporter::VERSION
  spec.authors       = ["Masatomo Nakano"]
  spec.email         = ["tomo@quipper.com"]
  spec.summary       = %q{Client library of Mixpanel Data Export API.}
  spec.description   = %q{Client library of Mixpanel Data Export API.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "httparty"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
