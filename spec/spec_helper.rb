$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'bundler/setup'
require 'weather_cli'
require 'webmock/rspec'

RSpec.configure do |config|
  WebMock.disable_net_connect!
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
