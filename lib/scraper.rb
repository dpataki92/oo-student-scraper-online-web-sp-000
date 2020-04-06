require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.scrape_index_page(index_url)

    html = open(index_url)
    doc = Nokogiri::HTML(html).css(".student-card")
    students = []
    doc.each do |hash|
      student = {}
      name = hash.css(".card-text-container h4").text
      location = hash.css(".card-text-container p").text
      profile_url = hash.css("a")[0]["href"]
      student[:name] = name
      student[:location] = location
      student[:profile_url] = profile_url
      students << student
    end
    students
  end

  def self.scrape_profile_page(profile_url)

  end

end
