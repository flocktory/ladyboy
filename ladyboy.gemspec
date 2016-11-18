# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ladyboy/version'

Gem::Specification.new do |spec|
  spec.name          = "ladyboy"
  spec.version       = Ladyboy::VERSION
  spec.authors       = ["Peter Yanovich"]
  spec.email         = ["fl00r@yandex.ru"]
  spec.summary       = %q{Hard choice: boy or girl}
  spec.description   = %q{Detecting sex by name}
  spec.homepage      = ""
  spec.license       = "Floctory"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"

  spec.add_dependency "unicode"
  spec.add_dependency "activesupport"
end
