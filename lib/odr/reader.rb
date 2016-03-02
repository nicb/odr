require 'net/http'
require 'uri'

module Odr

  module Reader

    #
    # <tt>read(uri)</tt>
    #
    # is passed the url of the resource and it returns the content of that
    # page in a single string
    #
    def read(uri)
      Net::HTTP.get(URI.parse(uri))
    end

  end

end
