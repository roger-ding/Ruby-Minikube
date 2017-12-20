require 'simplecov'
require 'simplecov-json'

module SimpleCov::Configuration
  def clean_filters
    @filters = []
  end
end

SimpleCov.configure do
  clean_filters
  load_adapter 'test_frameworks'
  # add_filter '/Users/roger.ding/.rbenv/'
end

SimpleCov.start 'test_frameworks'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  SimpleCov::Formatter::JSONFormatter
]

require_relative '../test'
require_relative '../more_test'
