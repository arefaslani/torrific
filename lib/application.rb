require 'optparse'
require 'torrific'

module Torrific
  class Application
    class << self
      attr_accessor :password, :port, :host, :interval, :daemonize, :tor_controller
      def run
        self.parse_options
        
        Process.daemon if self.daemonize

        trap('SIGINT') do
          puts "Bye Bye!"
          exit
        end

        self.tor_controller = TorControl.new(host: self.host, port: self.port, password: self.password)

        while true
          self.tor_controller.change_ip
          puts "Your identity has been changed."
          if(self.interval && self.interval > 0)
            sleep self.interval
          else
            break
          end
        end
      end

      def parse_options
        options = OptionParser.new do |opts|
          opts.banner = "Usage: torrific [options]"

          opts.on("--password PASSWORD",
                  "Sets the authentication password(default is nil)") do |pass|
            self.password = pass
          end

          opts.on("--host HOST", "Tor Control host(default is localhost)") do |host|
            self.host = host
          end

          opts.on("--port PORT",
                  "Tor Control port(default is 9051).") do |port|
            self.port = port
          end

          opts.on("--interval INT",
                   "Changes identity each INT seconds.(default is only once)") do |seconds|
            self.interval = seconds.to_i
          end

          opts.on("-d", "Daemonize the process") do
            self.daemonize = true
          end
        end

        options.parse!
      end
    end
  end
end