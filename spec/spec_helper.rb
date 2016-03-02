require "codeclimate-test-reporter"
SimpleCov.start do
  add_filter '/spec/'
  add_filter '/lib/tasks/'
  formatter SimpleCov::Formatter::MultiFormatter.new([
    SimpleCov::Formatter::HTMLFormatter,
    CodeClimate::TestReporter::Formatter
  ])
end
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'odr'
