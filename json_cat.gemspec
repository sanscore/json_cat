# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'json_cat/version'

Gem::Specification.new do |spec|
  spec.name          = "json_cat"
  spec.licenses      = ["Apache-2.0"]
  spec.version       = JsonCat::VERSION
  spec.authors       = ["Grant Welch"]
  spec.email         = ["gwelch925 at gmail.com"]

  spec.summary       = %q{Pretty print JSON files and standard input}
  spec.description   = %q{Format JSON to be easier to read; colorize, sort keys, etc. }
  spec.homepage      = "https://github.com/sanscore/json_cat/"

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = ["json_cat"]
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ['~> 2.0']

  spec.add_runtime_dependency "json"
  spec.add_runtime_dependency "rainbow", "~> 2.1"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
