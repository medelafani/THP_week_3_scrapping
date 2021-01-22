require 'rubygems'
require 'nokogiri'
require 'open-uri'

def scrapper
  page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
end

def making_hash(page)
  name_array = []
  value_array = []

  crypto_name = page.xpath('//tr//td[3]//div')
  crypto_value =  page.xpath('//tr//td[5]//div//a')

  crypto_name.each do |name|
    name_array << name.text
  end

  crypto_value.each do |value|
    value_array << value.text
  end


  crypto_wip = Hash[name_array.zip value_array]
  crypto_wip.each do |name , value|
   puts crypto_hash = {name => value}
  end
end

making_hash(scrapper)
