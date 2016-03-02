require 'optparse'

module Odr

  module CLI

    class << self

      def execute(stdout, arguments=[])
  
        options = { keys: [], list_keys: false, uri: [] }
        mandatory_options = %w(  )
  
        parser = OptionParser.new do |opts|
          opts.banner = <<-BANNER.gsub(/^          /,'')
            
            odr is a very simple JSON OpenData CLI reader
  
            Usage: #{File.basename($0)} [options] URL
  
            Options are:
          BANNER
          opts.separator ""
          opts.on("", "--keys", String,
                  'list all the keys for the given URI') { options.update(list_keys: true) }
          opts.on('-', '--key KEY', String,
                  "add this key to the column listing") { |arg| options[:keys] << arg }
          opts.on("-h", "--help",
                  "Show this help message.") { stdout.puts opts; exit }
          opts.parse!(arguments)
  
          if mandatory_options && mandatory_options.find { |option| options[option.to_sym].nil? }
            stdout.puts opts; exit
          end
        end
  
  			arguments.each { |uri| options[:uri] << uri }

        Odr::Execute.main(stdout, options)
      end

    end

  end

end
