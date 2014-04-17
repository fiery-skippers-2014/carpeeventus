require 'json'

module Eventbrite
  class Client
    include HTTParty
    base_uri 'https://www.eventbrite.com'

    def initialize(options = {})
      @latitude = options[:latitude]
      @longitude = options[:longitude]
      @radius = options[:radius] || 10
      @category = options[:category] || " "

      response = self.class.get("/json/event_search",
        :query => {category: @category, within: @radius, latitude: @latitude, longitude: @longitude, limit: 10, date: "today"},
        :headers => {"Authorization" => "Bearer XXV6SZPCEUT42ILGNOGL"})
      return parseForEvents(response.body)
    end

    def parseForEvents(response)
      @user_results = JSON.parse(response)
      return @user_results["events"]
    end

  end
end
