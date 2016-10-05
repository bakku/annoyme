# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'annoyme/version'

Gem::Specification.new do |spec|
  spec.name          = "annoyme"
  spec.version       = Annoyme::VERSION
  spec.authors       = ["Christian Paling"]
  spec.email         = ["christian.paling@googlemail.com"]

  spec.summary       = %q{helpfully annoys you on your command line}
  spec.homepage      = "https://github.com/bakku/annoyme"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency 'simplecov', '~> 0.12'
  spec.add_runtime_dependency     'thor', '~> 0.19'
  spec.add_runtime_dependency     'rainbow', '~> 2.1'
end
