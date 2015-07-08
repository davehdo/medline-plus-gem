require "medline_plus/version"

module MedlinePlus
  require 'net/http'
  require "addressable/uri"
  require "nokogiri"

  # returns search results
  # [{"Aspirin"=>"http://www.nlm.nih.gov/medlineplus/druginfo/meds/a682878.html"}, ...]
  def self.search_drug( query )
    url = Addressable::URI.parse("http://apps.nlm.nih.gov/medlineplus/services/mpconnect_service.cfm")
    url.query_values = {"mainSearchCriteria.v.cs" => "2.16.840.1.113883.6.69", "mainSearchCriteria.v.dn" => query, "informationRecipient.languageCode.c" => "en"}

    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    xml = Nokogiri::HTML(res.body)
    results = Hash[xml.css("entry").collect {|e| [e.at_css("title").inner_html.downcase, e.at_css("link").attribute("href").value]}]
    puts "There are #{xml.css("entry").size} results, #{results}."
    results
  end
  
  # returns drug info if there exists a precise name match
  # [{title: "Title", body: "<p>Body in html</p>"}, ...]
  def self.find_drug_by_name( query )
    results = search_drug( query )
    if results[query.downcase]
      url = URI.parse(results[query.downcase])
      req = Net::HTTP::Get.new(url.to_s)
      res = Net::HTTP.start(url.host, url.port) {|http|
        http.request(req)
      }
      html = Nokogiri::HTML(res.body)
      sections = html.at_css("div[id=\"mplus-content\"]").css("section").collect do |section|
        {
          title: section.at_css(".section-title").inner_text,
          body: section.at_css(".section-body").inner_html
        }
      end
    else
      nil
    end
  end
  
  def self.search( query )
    url = Addressable::URI.parse("http://wsearch.nlm.nih.gov/ws/query")
    url.query_values = {:db => "healthTopics", :term => query}

    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    xml = Nokogiri::HTML(res.body)
    puts "There are #{xml.css("count").inner_html} results for --#{xml.css("term").inner_html}--, #{xml.css("document").collect {|e| e.css("content[name=\"title\"]").inner_html}}."
    xml
  end

end
