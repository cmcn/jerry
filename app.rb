require 'rubygems'
require 'sinatra'
require 'httparty'
require 'json'

HELP_TEXT = "
```
!dog      # retrieves a picture of a cute ass pupper
!pick     # Jerry will decide your fate from a list of comma-separated options
            !pick live,die
!roulette # play Russian Roulette with Jerry```
"

post '/gateway' do
  text = params[:text]
  command = text.split.first

  case command
  when "!dog"
    return get_dog
  when "!pick"
    return pick_option
  when "!roulette"
    return play_roulette
  when "!help"
    respond_with(HELP_TEXT)
  else
    return respond_with("fuck u m8")
  end
end

private

def respond_with(message)
  { text: message }.to_json
end

def get_dog
  resp = HTTParty.get("https://webtask.it.auth0.com/api/run/wt-cpmpal-gmail_com-0/test?webtask_no_cache=1")
  respond_with(resp["text"])
end

def pick_option
  options = params[:text].split[1].split(",")
  respond_with(options[rand(options.length)])
end

def play_roulette
  if rand(6) == 0
    respond_with("Bang! you're dead :boom: :gun:")
  else
    respond_with("You live.... for now.")
  end
end
