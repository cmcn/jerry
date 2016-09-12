require 'rubygems'
require 'sinatra'
require 'json'

post '/gateway' do
  { text: "fuck u m8" }.to_json
end
