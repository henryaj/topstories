require 'rubygems'
require 'sinatra'
require 'simple-rss'
require 'open-uri'

get '/' do
  @guardian = SimpleRSS.parse open("http://www.theguardian.com/uk/rss")
  @aljaz = SimpleRSS.parse open("http://www.aljazeera.com/Services/Rss/?PostingId=2007731105943979989")
  @skynews = SimpleRSS.parse open("http://news.sky.com/feeds/rss/home.xml")
  @beeb = SimpleRSS.parse open("http://feeds.bbci.co.uk/news/rss.xml?edition=uk")
  @cnn = SimpleRSS.parse open("http://rss.cnn.com/rss/edition.rss")
  erb :index
end