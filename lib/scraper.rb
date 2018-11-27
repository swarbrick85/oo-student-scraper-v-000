require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  attr_accessor :student_hashes, :bio, :quote, :twitter, :linkedin, :github, :blog, :student_hashe
  @student_hashes = []
  @student_hash = {}


  def self.scrape_index_page(index_url)

    doc = Nokogiri::HTML(open("#{index_url}"))
    students = doc.css("a")
    students.each do |card|
      a = card.css("h4").text
      b = card.css("p").text
      c = a.gsub(' ', '-').downcase
      e = "students/#{c}.html"
      d = {}

      d[:name] = a
      d[:location] = b
      d[:profile_url] = e
      @student_hashes << d
    end
    @student_hashes.delete_at(0)
    @student_hashes
  end

  def self.scrape_profile_page(profile_url)
    doc = Nokogiri::HTML(open("#{profile_url}"))

      bio = doc.css("p").text
      quote = doc.css("div")[6].text

    doc.css("a").each do |x|
      if x["href"].include?("twitter")
        twitter = x["href"]
      elsif x["href"].include?("github")
        github = x["href"]
      elsif x["href"].include?("linkedin")
        linkedin = x["href"]
      else
        blog = x["href"]
      end
    end


    if twitter
      @student_hash[:twitter] = twitter
    end
    if linkedin
      @student_hash[:linkedin] = linkedin
    end
    if github
      @student_hash[:github] = github
    end
    if blog
      @student_hash[:blog] = blog
    end
    if bio
      @student_hash[:bio] = bio
    end
    if quote
      @student_hash[:profile_quote] = quote
    end
    @student_hash

  end

end
