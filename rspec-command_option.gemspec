# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspec/command_option/version'

Gem::Specification.new do |spec|
  spec.name          = "rspec-command_option"
  spec.version       = RSpec::CommandOption::VERSION
  spec.authors       = ["Kyohei Shimada"]
  spec.email         = ["fl95to03pj30sq12@gmail.com"]
  spec.summary       = %q{It is option command builder of 'rspec' for RSpec::Core::RakeTask#rspec_opts}
  spec.description   = %q{It is option command builder of 'rspec' for RSpec::Core::RakeTask#rspec_opts}
  spec.homepage      = "https://github.com/kyohei-shimada/rspec-command_option"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.1"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_runtime_dependency 'command-builder'
end
