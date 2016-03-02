require 'multi_json'

module Odr

  module Execute

    class << self

      include Odr::Reader

      #
      # <tt>main(stdout, args)</tt>
      #
      # +main+ is actually the beginning method where everything starts. It is
      # passed an argument (the ARGS argument passed through the +CLI::excute+
      # method). It exits upon return.
      #
      def main(stdout, args)
        uris = args[:uri]

        uris.each do
          |uri|
          data = MultiJson.load(read(uri), symbolize_keys: true)
          if args[:list_keys]
            print_keys(stdout, data)
          end
        end

        return 0
      end

    private

      def print_keys(stdout, data)
        data.each do
          |k, v|
          sz = v.is_a?(Array) ? v.size : 1
          stdout.puts("%-20s %10d" % [ k.to_s + ':', sz ])
        end
      end

    end

  end

end
