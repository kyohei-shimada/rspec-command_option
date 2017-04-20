$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'rspec/command_option'
require 'simplecov'

if ENV['CIRCLE_ARTIFACTS']
  dir = File.join(ENV['CIRCLE_ARTIFACTS'], "coverage")
  SimpleCov.coverage_dir(dir)
end

SimpleCov.start

if ENV['CIRCLE_ARTIFACTS']
  require 'codecov'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end
