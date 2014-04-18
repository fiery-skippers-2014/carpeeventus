require 'json'

module Eventbrite
  class Client
    include HTTParty
    base_uri 'https://www.eventbrite.com'

    def initialize(options = {})
      @latitude = options[:latitude]
      @longitude = options[:longitude]
      @radius = options[:radius] || "10"
      @category = options[:category] || " "

      response = self.class.get("/json/event_search",
        :query => {category: @category, within: @radius.to_i, within_unit: "M", latitude: @latitude, longitude: @longitude, max: 10, date: "Today"},
        :headers => {"Authorization" => "Bearer XXV6SZPCEUT42ILGNOGL"})
      return parseForEvents(response.body)
    end

    def parseForEvents(response)
      @user_results = JSON.parse(response)
      return @user_results["events"]
    end

  end
end
