# Torrific

A wrapper to 'tor' gem for change Tor identity from the command line.
For this program to work correctly, Tor cli should be installed and the
ControlPort part of the torrc file should be uncommented.

## Installation

Add this line to your application's Gemfile:

    gem 'torrific'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install torrific

## Usage

torrific [options]

### Options

* host: Tor control host(default is 127.0.0.1)
* port: Tor control port(default is 9051)
* password: Tor control authentication password(default is empty)
* d(daemonize): Daemonize the process.
* interval: Set interval for the process.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/torrific/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
