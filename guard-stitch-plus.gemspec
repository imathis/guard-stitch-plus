# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'guard/stitch-plus/version'

Gem::Specification.new do |gem|
  gem.name          = "guard-stitch-plus"
  gem.version       = Guard::StitchPlusVersion::VERSION
  gem.authors       = ["Brandon Mathis"]
  gem.email         = ["brandon@imathis.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = "https://github.com/imathis/guard-stitch-plus"
  gem.license       = "MIT"

  gem.add_runtime_dependency 'guard', '>= 1.1.0'
  gem.add_runtime_dependency 'stitch-rb', '>= 0.0.8'
  gem.add_runtime_dependency 'colorator', '>= 0.1'

  gem.files         = `git ls-files`.split($/)
  gem.require_paths = ["lib"]
end
