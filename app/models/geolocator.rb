require 'json'


# module Reddit
#   class Client
#     include HTTParty
#     base_uri 'http://www.reddit.com'

#     def get_posts(user)
#        response = self.class.get("/user/#{user}.json",
#         :query => { limit: 3 }
#         )
#        return parseForSubreddits(response.body)
#     end

# end

