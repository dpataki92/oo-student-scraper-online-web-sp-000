require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.scrape_index_page(index_url)

    html = open(index_url)
    doc = Nokogiri::HTML(html)
    students = doc.css(".student-card").collect do |hash|
      student = {}
      student[:name] = doc.css(".card-text-container h4").text
      student[:location] = doc.css(".card-text-container p").text
      student[:profile_url] = doc.css(".student-card a")[0]["href"]
      student
    end
    students
    binding.pry
  end

  def self.scrape_profile_page(profile_url)

  end

end
