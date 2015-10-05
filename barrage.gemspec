# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'barrage/version'

Gem::Specification.new do |spec|
  spec.name          = "barrage_bench"
  spec.summary       = 'A benchmarking tool to make benchmarking and collecting statistics from the run and system hardware simple'
  spec.description   = 'see summary'
  spec.version       = Barrage::VERSION
  spec.authors       = ["kellabyte"]
  spec.email         = ["kell.sommers@gmail.com"]
  spec.homepage      = "http://github.com/kellabyte/barrage"
  spec.license       = "Apache 2.0"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'thor'
  spec.add_runtime_dependency 'gnuplot'
  spec.add_runtime_dependency 'imgurr'

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
