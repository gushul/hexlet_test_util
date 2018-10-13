require 'json'

module WeatherCli
  class Parser
    attr_reader :data

    def initialize(data)
      @data = data
    end

    def fetch_location
      binding.pry
      data
    end

    def fetch_weather; end

    def self.call(json); end
  end
end
