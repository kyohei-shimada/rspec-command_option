$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'rspec/command_option'

require 'simplecov'
SimpleCov.start

require 'codecov'
SimpleCov.formatter = SimpleCov::Formatter::Codecov
