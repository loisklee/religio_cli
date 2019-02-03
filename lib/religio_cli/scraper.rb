class ReligioCLI::Scraper

  def self.initiate_scraper
    ReligioCLI::Trads.create_from_array(religion_scraper)
    ReligioCLI::Trads.all.each do |religion|
      religion.religion_details(religion_details_scraper(religion.url))
    end
  end

  def self.religion_scraper
    doc = Nokogiri::HTML(open("https://www.patheos.com/library"))
    religion_hashes = []
    doc.css ("div.col-lg-3.col-md-4.col-xs-6.remove-padding.related-content.colored.brand-prime-1").each do |content|
      name = content.css("h2.remove-margin.over-dark.text-uppercase").text
      quick_facts = content.css(div.details.text-uppercase).text.strip.gsub("\r\n "+" "," ")
      url = content.css("a").map{|link| link['href']}[0]
      religion_hashes << {:name => name, :url => url, :quick_facts => quick_facts}    end
    religion_hashes
  end

  def self.religion_details_scraper(url)
    doc = Nokogiri::HTML(open(url))
    description = doc.css("div.dropcap.buffer-bottom").text
    religion_details = {:description => description}
    religion_details
  end

end
