require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.scrape_index_page(index_url)

    html = open(index_url)
    doc = Nokogiri::HTML(html)
    students = []
    doc.css(".student-card").each do |hash|
      student = {}
      student[:name] = doc.css(".card-text-container h4")[0].text
      student[:location] = doc.css(".card-text-container p")[0].text
      student[:profile_url] = doc.css(".student-card a")[0]["href"]
      students << student
    end
    students
    binding.pry
  end

  def self.scrape_profile_page(profile_url)

  end

end
