Lita.configure do |config|
  # The name your robot will use.
  config.robot.name = "jerry"
  config.robot.mention_name = "jerry"
  config.robot.locale = :en

  config.robot.adapter = :slack
  config.adapters.slack.token = "xoxb-78370690743-EAsMLLU8gBCco1JaFHzy0D0E"
  # config.adapters.slack.link_names = true
  # config.adapters.slack.parse = "full"
  # config.adapters.slack.unfurl_links = false
  # config.adapters.slack.unfurl_media = false





  # The severity of messages to log. Options are:
  # :debug, :info, :warn, :error, :fatal
  # Messages at the selected level and above will be logged.
  config.robot.log_level = :debug

  # An array of user IDs that are considered administrators. These users
  # the ability to add and remove other users from authorization groups.
  # What is considered a user ID will change depending on which adapter you use.
  # config.robot.admins = ["1", "2"]

  # The adapter you want to connect with. Make sure you've added the
  # appropriate gem to the Gemfile.
  # config.robot.adapter = :shell

  ## Example: Set options for the chosen adapter.
  # config.adapter.username = "myname"
  # config.adapter.password = "secret"

  ## Example: Set options for the Redis connection.
  config.redis = {
    host:  "viperfish.redistogo.com",
    port: 11919,
    password: "efe686f13108ea5a1995421c6aeeb27f"
  }

  ## Example: Set configuration for any loaded handlers. See the handler's
  ## documentation for options.
  # config.handlers.some_handler.some_config_key = "value"
end
