require 'json'


module Reddit
  class Client
    include HTTParty
    base_uri 'http://www.reddit.com'

    def get_posts(user)
       response = self.class.get("/user/#{user}.json",
        :query => { limit: 3 }
        )
       return parseForSubreddits(response.body)
    end

    def parseForSubreddits(response)
      parsed_data = JSON.parse(response)
      lists_of_posts = parsed_data["data"]['children']
      list_of_subreddits = lists_of_posts.map do |post|
        post['data']['subreddit']
      end
      list_of_subreddits
    end

    def get_down_votes(user)
      response = self.class.get("/user/#{user}.json",
        :query => { limit: 50 }
        )
      parsed_data = JSON.parse(response.body)
      lists_of_posts = parsed_data["data"]['children']
      list_of_downs = lists_of_posts.map do |post|
        post['data']['downs']
      end
      list_of_downs
    end

    def get_up_votes(user)
      response = self.class.get("/user/#{user}.json",
        :query => { limit: 50 }
        )
      parsed_data = JSON.parse(response.body)
      lists_of_posts = parsed_data["data"]['children']
      list_of_ups = lists_of_posts.map do |post|
        post['data']['ups']
      end
      list_of_ups.reduce
    end
  end
end

