# coding: utf-8

require File.expand_path('../lib/minitest/reporters/fail', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = "minitest-reporters-fail"
  spec.version       = Minitest::Reporters::Fail::VERSION
  spec.authors       = ["David Conner"]
  spec.email         = ["dconner.pro@gmail.com"]
  spec.description   = %q{A Minitest Reporter that Shows Failure Detail and Emoji}
  spec.summary       = %q{A Minitest Reporter that Shows Failure Detail and Emoji!}
  spec.homepage      = "https://github.com/dcunited001/minitest-reporters-fail"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'ansi'
  spec.add_dependency "minitest-reporters", ">= 0.14"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
