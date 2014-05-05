require 'open-uri'
require 'json'

class CoordsController < ApplicationController
  def fetch_weather
    @address = params[:address]
    if @address == nil
      @url_safe_address = URI.encode("the corner of Foster and Sheridan")
    else
      @url_safe_address = URI.encode(@address)
    end

    # Your code goes here.
    url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{@url_safe_address}+&sensor=false"
    raw_data = open(url).read
    parsed_data = JSON.parse(raw_data)
    if parsed_data["results"][0] != nil
        @latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]
        @longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]
    else
        @latitude = 0.0
        @longitude = 0.0
    end

    your_api_key = "28d93f8e38dfa9d0a4ecbfc541f1df61"

    # Your code goes here.
    url = "https://api.forecast.io/forecast/28d93f8e38dfa9d0a4ecbfc541f1df61/#{@latitude},#{@longitude}"
    raw_data = open(url).read
    parsed_data = JSON.parse(raw_data)
    @temperature = parsed_data["currently"]["temperature"]
    @minutely_summary = parsed_data["minutely"]["summary"]
    @hourly_summary = parsed_data["hourly"]["summary"]
    @daily_summary = parsed_data["daily"]["summary"]
  end
end
