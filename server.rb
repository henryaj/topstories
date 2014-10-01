require 'rubygems'
require 'sinatra'
require 'simple-rss'
require 'open-uri'
require 'nokogiri'

get '/' do
  get_the_news
  erb :index
end



def get_the_news
  @guardian = SimpleRSS.parse open("http://www.theguardian.com/uk/rss")
  @aljaz = SimpleRSS.parse open("http://www.aljazeera.com/Services/Rss/?PostingId=2007731105943979989")
  @skynews = SimpleRSS.parse open("http://news.sky.com/feeds/rss/home.xml")
  
  @bbc_icon = get_site_favicon('http://bbc.co.uk/news')
  @beeb = SimpleRSS.parse open("http://feeds.bbci.co.uk/news/rss.xml?edition=uk")
  @cnn = SimpleRSS.parse open("http://rss.cnn.com/rss/edition.rss")
end

def get_site_favicon(site)
  page = Nokogiri::HTML(open(site))
  page.css("link[rel=apple-touch-icon]")[0]["href"]
rescue
end

def get_root_url(url)
end

# get_site_favicons('http://bbc.co.uk/news')