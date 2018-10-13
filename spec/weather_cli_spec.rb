require 'spec_helper'

RSpec.describe WeatherCli::Init do
  let(:city) { 'Moscow' }
  let(:body) { '[{"title":"Moscow","location_type":"City","woeid":2122265,"latt_long":"55.756950,37.614971"}]' }
  let(:body1)  { '{"consolidated_weather":[{"the_temp":13.33333}]}' }
  let(:subject) { described_class.new }
  describe '#call' do
    it 'return string' do
      stub_request(:get, 'https://www.metaweather.com/api/location/search/?query=Moscow')
        .to_return(status: 200, body: body, headers: {})
      stub_request(:get, 'https://www.metaweather.com/api/location/2122265/')
        .to_return(status: 200, body: body1, headers: {})

      expect(subject.call(city)).to eq(13.33)
    end
  end
end
