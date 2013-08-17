# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'guard/stitch-plus/version'

Gem::Specification.new do |gem|
  gem.name          = "guard-stitch-plus"
  gem.version       = Guard::StitchPlusVersion::VERSION
  gem.authors       = ["Brandon Mathis"]
  gem.email         = ["brandon@imathis.com"]
  gem.description   = %q{A Guard plugin for compiling javascripts with Stitch Plus.}
  gem.summary       = %q{A Guard plugin for compiling javascripts with Stitch Plus.}
  gem.homepage      = "https://github.com/imathis/guard-stitch-plus"
  gem.license       = "MIT"

  gem.add_runtime_dependency 'guard', '>= 1.1.0'
  gem.add_runtime_dependency 'stitch-plus', '>= 1.0.4'

  gem.files         = `git ls-files`.split($/)
  gem.require_paths = ["lib"]
end
