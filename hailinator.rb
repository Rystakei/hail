require "twitter"

Twitter.configure do |config|
  config.consumer_key = "Pwd2CVvJdeavPPhsbWA"
  config.consumer_secret = "ZAC2U9iY6anfcabdOsTS9EDdLXSp5Zwq5GGdQQ"
  config.oauth_token = "385680001-v4Ru9tnVPmjLuZKkELQRtSm7yirX2EzHt5pg7nXA"
  config.oauth_token_secret = "3t0tEKClCyARFd06NxaCt7YQPHHCWV1zH18Hk6aVE"
end


require 'csv'

CSV.open("users_with_hail_damage.csv", "w") do |csv|
  		csv << ["handle", "text", "url"]

  		Twitter.search("#hail #damage").results.map do |status|
			puts "#{status.from_user}: #{status.text}"
			puts status.inspect
		
		csv <<  [status.user.screen_name, status.text, "https://twitter.com/#{status.user.screen_name}/statuses/#{status.id}"]

		end

 end

#  Twitter.search("#austin #events").results.map do |status|
# 			puts "#{status.from_user}: #{status.text}"
# 			puts status.inspect

# 			Twitter.favorite(status.id)
# 			# Twitter.follow(status.user.screen_name)
# end