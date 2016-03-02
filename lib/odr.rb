require "odr/version"

module Odr
  PATH = File.expand_path(File.join('..', 'odr'), __FILE__)
end

%w(
  reader
).each { |f| require File.join(Odr::PATH, f) }
