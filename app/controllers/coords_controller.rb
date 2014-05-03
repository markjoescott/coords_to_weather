require 'open-uri'
require 'json'

class CoordsController < ApplicationController
  def fetch_weather
    @latitude = 42.0538387
    @longitude = -87.67721
    your_api_key = "28d93f8e38dfa9d0a4ecbfc541f1df61"

    # Your code goes here.
    url = "https://api.forecast.io/forecast/28d93f8e38dfa9d0a4ecbfc541f1df61/37.8267,-122.423"
    raw_data = open(url).read
    parsed_data = JSON.parse(raw_data)
    @temperature = parsed_data["currently"]["temperature"]
    @minutely_summary = parsed_data["minutely"]["summary"]
    @hourly_summary = parsed_data["hourly"]["summary"]
    @daily_summary = parsed_data["daily"]["summary"]
  end
end
