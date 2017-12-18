#!/usr/bin/env ruby
require 'rubygems'

# Test class for string
class StringOps
  def to_upper(string)
    string.upcase
  end

  def to_lower(string)
    string.downcase
  end

  def count(string)
    string.length
  end

  def to_empty(_string)
    ''
  end
end

object = StringOps.new
puts object.to_upper('hello')
puts object.count('hello world')
