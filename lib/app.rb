require 'rubygems'
require 'nokogiri'
require 'open-uri'

def scrapper
  $page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
    $crypto_name = $page.xpath('//tr//td[3]//div')
    $crypto_value =  $page.xpath('//tr//td[5]//div//a')
end

def making_hash(crypto_name, crypto_value)
  name_array = []
  value_array = []

  $crypto_name.each do |name|
    name_array << name.text
  end

  $crypto_value.each do |value|
    value_array << value.text
  end

 crypto_wip = Hash[name_array.zip value_array]

  crypto_wip.each do |name , value|
  $crypto_hash = {name => value.to_f}
  end

end

def perform(crypto_name, crypto_value)
scrapper
making_hash(crypto_name, crypto_value)
end

perform($crypto_name, $crypto_value)
