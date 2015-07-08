# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'medline_plus/version'

Gem::Specification.new do |spec|
  spec.name          = "medline_plus"
  spec.version       = MedlinePlus::VERSION
  spec.authors       = ["David Do"]
  spec.email         = ["davehdo@gmail.com"]
  spec.summary       = %q{Good luck.}
  spec.description   = %q{An easy way to get medication information from the MedlinePlus API}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "addressable", "2.3.7"
  spec.add_dependency "nokogiri", "1.6.6.2"
  
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
