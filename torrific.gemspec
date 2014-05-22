# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'torrific/version'

Gem::Specification.new do |spec|
  spec.name          = "torrific"
  spec.version       = Torrific::VERSION
  spec.authors       = ["Aref Aslani"]
  spec.email         = ["arefaslani@gmail.com"]
  spec.summary       = %q{Change tor identity}
  spec.description   = %q{A wrapper on tor gem for changing tor identity from the command line.}
  spec.homepage      = "https://github.com/arefaslani/torrific"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_runtime_dependency "tor", '~> 0.1.2'
end
