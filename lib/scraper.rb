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
      student[:name] = hash.css(".card-text-container h4").text
      student[:location] = hash.css(".card-text-container p").text
      student[:profile_url] = hash.css("a")[0]["href"]
      students << student
    end
    students
  end

  def self.scrape_profile_page(profile_url)
    html = open(profile_url)
    doc = Nokogiri::HTML(html)
    social = doc.css(".social-icon-container a")
    twitter = nil
    linkedin = nil
    github = nil
    blog = nil
    profile_quote = doc.css(".vitals-text-container.profile-quote").text
    bio = doc.css("div details-container.description-holder p").text

    social.each {|el|
    if el[0]["href"].include?("twitter")
      twitter = el[0]["href"]
    elsif el[0]["href"].include?("linkedin")
      linkedin = el[0]["href"]
    elsif el[0]["href"].include?("github")
      github = el[0]["href"]
    else
      blog = el[0]["href"]
    end
    }

    binding.pry
    
    student = {}
    student[:twitter] = twitter if twitter
    student[:linkedin] = linkedin if linkedin
    student[:github] = github if guthub
    student[:blog] = blog if blog
    student[:profile_quote] = profile_quote if profile_quote
    student[:bio] = bio if bio
    student
    
  end

end
