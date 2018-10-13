require 'net/http'
require 'uri'
require 'json'

module WeatherCli
  class Init
    BASE_URI = 'https://www.metaweather.com/api/location/'.freeze

    def call(city)
      return 'Error' if city.nil? || city.empty?

      woeid = get_woeid(city)
      get_data(woeid)
    end

    private

    def get_woeid(city)
      url = BASE_URI + 'search/?query=' + city
      uri = URI url
      data = Net::HTTP.get(uri)
      parser.new(data).fetch_woeid
    end

    def get_data(woeid)
      url = BASE_URI + woeid + '/'

      uri = URI url
      data = Net::HTTP.get(uri)
      parser.new(data).fetch_weather
    end

    def parser
      @_parser ||= WeatherCli::Parser
    end
  end

  class Parser
    attr_reader :data

    def initialize(data)
      @data = data
    end

    def fetch_woeid
      json = JSON.parse(data).last
      json.dig('woeid').to_s
    end

    def fetch_weather
      json = JSON.parse(data)
      weather = json.dig('consolidated_weather').first
print
      temp = weather.dig('the_temp')
      temp.round(2)
    end
  end
end
