require 'spec_helper'

describe Rspec::CommandOption do
  it 'has a version number' do
    expect(Rspec::CommandOption::VERSION).not_to be nil
  end
end
