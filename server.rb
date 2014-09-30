require 'rubygems'
require 'sinatra'
require 'simple-rss'
require 'open-uri'

get '/' do
  @guardian = SimpleRSS.parse open("http://www.theguardian.com/uk/rss")

  erb :index
end