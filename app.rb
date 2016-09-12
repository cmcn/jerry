require 'rubygems'
require 'sinatra'
require 'httparty'
require 'json'

post '/gateway' do
  if params[:text][0..3] == "!dog"
    resp = HTTParty.get("https://webtask.it.auth0.com/api/run/wt-cpmpal-gmail_com-0/test?webtask_no_cache=1")
    return get_dog
  else
    return { text: "fuck u m8" }.to_json
  end
end

def get_dog
  resp = HTTParty.get("https://webtask.it.auth0.com/api/run/wt-cpmpal-gmail_com-0/test?webtask_no_cache=1")
  return { text: resp["text"] }.to_json
end
