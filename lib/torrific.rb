require "torrific/version"
require 'tor'

module Torrific
  class TorControl < ::Tor::Controller
    attr_accessor :password
    
    def initialize(options)
      self.password = options.fetch(:password) { nil }
      super options
    end

    # changes the tor identity
    def change_ip
      self.connect
      self.authenticate self.password
      send_command(:signal, 'NEWNYM')
      self.close
    end
  end
end