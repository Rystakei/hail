require "twitter"

Twitter.configure do |config|
  config.consumer_key = "1pHoFSwmmCqu5KcVkFyydw"
  config.consumer_secret = "ulzqPqRz7H6XctZPStBTK4xFNEi3YWqOaaPWeTm8dS0"
  config.oauth_token = "385680001-wBA3FZTqcIXhny14zusBwHa9sXj9sQBjZjAuiKse"
  config.oauth_token_secret = "5yuHvNIyPf9GMDutJvtL47oDMJ5sswaDFxQT7Re1ws"
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


 Twitter.search("#austin #events").results.map do |status|
			puts "#{status.from_user}: #{status.text}"
			puts status.inspect

			Twitter.favorite(status.id)
			# Twitter.follow(status.user.screen_name)
end