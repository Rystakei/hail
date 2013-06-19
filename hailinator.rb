require "twitter"

Twitter.configure do |config|
  config.consumer_key = "Pwd2CVvJdeavPPhsbWA"
  config.consumer_secret = "ZAC2U9iY6anfcabdOsTS9EDdLXSp5Zwq5GGdQQ"
  config.oauth_token = "385680001-v4Ru9tnVPmjLuZKkELQRtSm7yirX2EzHt5pg7nXA"
  config.oauth_token_secret = "3t0tEKClCyARFd06NxaCt7YQPHHCWV1zH18Hk6aVE"
end

Twitter.home_timeline

hail_results = []

Twitter.search("#hail, #damage", :result_type => "recent").results.map do |status|
  "#{status.from_user}: #{status.text}"
  hail_results << status
end
