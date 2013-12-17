# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lokaty/version'

Gem::Specification.new do |spec|
  spec.name          = "lokaty"
  spec.version       = Lokaty::VERSION
  spec.authors       = ["Tijmen Brommet"]
  spec.email         = ["tijmen@gmail.com"]
  spec.description   = %q{Get the country code for a IP address}
  spec.summary       = %q{Get the country code for a IP address. Wrapper around the GeoIP gem.}
  spec.homepage      = "http://github.com/tijmenb/lokaty"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_dependency "geoip"
end
