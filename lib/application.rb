require 'optparse'
require 'torrific'

module Torrific
  class Application
    class << self
      attr_accessor :password, :port, :host
      def run
        self.parse_options

        tor = TorControl.new(host: self.host, port: self.port, password: self.password)
        tor.change_ip
      end

      def parse_options
        options = OptionParser.new do |opts|
          opts.banner = "Usage: torrific [options]"

          opts.on("--password PASSWORD",
                  "Sets the authentication password(default is nil)") do |pass=nil|
            self.password = pass
          end

          opts.on("--host HOST", "Tor Control host(default is localhost)") do |host='127.0.0.1'|
            self.host = host
          end

          opts.on("--port PORT",
                  "Tor Control port(default is 9051).") do |port=9051|
            self.port = port
          end
        end

        options.parse!
      end
    end
  end
end