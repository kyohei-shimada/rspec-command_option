require "rspec/command_option/version"
require 'command-builder'

module RSpec
  class CommandOption
    NO_ARGS_OPTIONS = %i( fail_fast dry_run color warnings backtrace )
    ARGS_OPTIONS = %i( options failure_exit_code format out deprecation_out tag )
    OPTIONS = NO_ARGS_OPTIONS + ARGS_OPTIONS

    attr_accessor *OPTIONS

    def initialize(&block)
      block.call(self) if block
    end

    def build
      cmd = CommandBuilder.new(nil) # don't use command name
      NO_ARGS_OPTIONS.select {|opt| send(opt) }.map {|opt| cmd.argument(opt.to_s.gsub('_', '-')) }
      ARGS_OPTIONS.select {|opt| send(opt) }.map {|opt| cmd.argument(opt.to_s.gsub('_', '-'), send(opt)) }
      cmd.to_s.strip
    end
    alias_method :to_s, :build # API for RSpec::Core::RakeTask#spec_command
  end
end
