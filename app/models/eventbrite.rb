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
        :query => {category: @category}, within: @radius, latitude: @latitude, longitude: @longitude, limit: 100},
        :headers => {"Authorization" => "Bearer XXV6SZPCEUT42ILGNOGL"})
      parseForEvents(response)
    end

    def parseForEvents(response)
      @user_results = JSON.parse(response)

    end

  end
end
