# Rspec::CommandOption

It is option command builder of 'rspec' for RSpec::Core::RakeTask#rspec_opts

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rspec-command_option'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rspec-command_option

## Usage

### The simplest examples

```ruby
require 'rspec/command_option'

option_example1 = RSpec::CommandOption.new do |opt|
  opt.dry_run = true
  opt.color = true
  opt.tag = "~speed:slow"
end

puts option_example1.build #=> '--dry-run --color --tag=\~speed:slow'
```

```ruby
require 'rspec/command_option'

option_example2 = RSpec::CommandOption.new
option_example2.dry_run = true
option_example2.format = 'documentation'

puts option_example2.build #=> '--dry-run --format=documentation'
```

### With RSpec::Core::RakeTask

```ruby
require 'rspec/core/rake_task'
require 'rspec/command_option'

rspec_opts = RSpec::CommandOption.new do |opt|
  opt.dry_run = true
  opt.color = true
  opt.tag = "~speed:slow"
end

# If you execute this rake task, It will execute 'rspec' command with '--dry-run --color --tag=\~speed:slow' options
desc "Run examples"
RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = rspec_opts
end
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/rspec-command_option/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
