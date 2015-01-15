require 'spec_helper'

describe RSpec::CommandOption do
  it 'has a version number' do
    expect(RSpec::CommandOption::VERSION).not_to be nil
  end

  describe '#build' do
    context 'without all configuration' do
      subject(:command) { RSpec::CommandOption.new.build }

      it { is_expected.to eq '' }
    end

    context 'with no arguments option' do
      subject(:command) {
        RSpec::CommandOption.new {|opt|
          opt.color = true
        }.build
      }

      it { is_expected.to eq '--color' }
    end

    context 'with argument option' do
      subject(:command) {
        RSpec::CommandOption.new {|opt|
          opt.format = 'documentation'
        }.build
      }

      it { is_expected.to eq '--format=documentation' }
    end

    context 'with multiple valid options' do
      subject(:command) {
        RSpec::CommandOption.new {|opt|
          opt.color = true
          opt.dry_run = true
          opt.tag = "skip"
        }.build
      }

      it {
        is_expected.to include '--color'
        is_expected.to include '--dry-run'
        is_expected.to include 'tag=skip'
      }
    end

    context 'with invalid options' do
      subject(:command) {
        RSpec::CommandOption.new {|opt|
          opt.invalid_option = 'invalid_argument'
        }.build
      }

      it { expect{command}.to raise_error NoMethodError }
    end
  end
end
