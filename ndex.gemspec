# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pet/version'

Gem::Specification.new do |spec|
  spec.name          = "pet"
  spec.version       = PET::VERSION
  spec.authors       = ["Alexandre Dantas"]
  spec.email         = ["eu@alexdantas.net"]
  spec.summary       = %q{Pokemon Encyclopedia for the Terminal}
  spec.description   = %q{TODO: Write a gem description}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency = "rndk"
  spec.add_dependency = "sqlite3"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
