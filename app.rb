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
    get_dog
  when "!pick"
    pick_option
  when "!roulette"
    play_roulette
  when "!help"
    respond_with(HELP_TEXT)
  else
    respond_with("fuck u m8")
  end
end

private

def respond_with(message)
  { text: message }.to_json
end

def format_message(message)
  message.strip
end

def get_dog
  resp = HTTParty.get("http://reddit.com/r/dogpictures.json?limit=100&type=link", headers: { "User-Agent" => 'brendanfest-jerry' })
  respond_with("<#{resp["data"]["children"][rand(100)]["data"]["preview"]["images"].first["source"]["url"]}>")
end

def pick_option
  options = params[:text][5..-1].split(',')
  respond_with(format_message(options[rand(options.length)]))
end

def play_roulette
  if rand(6) == 0
    respond_with("Bang! you're dead :boom: :gun:")
  else
    respond_with("You live.... for now.")
  end
end
