require 'rubygems'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(URI.open("https://fr.wikipedia.org/wiki/France"))
page.xpath('//h3/span').each do |cat|
  puts cat.text
end
