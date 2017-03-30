require 'simplecov'
require 'logger'

SimpleCov.start do
  add_filter '/spec/'
end

SimpleCov.minimum_coverage_by_file 90
