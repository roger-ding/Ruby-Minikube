require 'simplecov'
require 'simplecov-json'

SimpleCov.start

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  SimpleCov::Formatter::JSONFormatter
]

require_relative '../test'
require_relative '../more_test'
