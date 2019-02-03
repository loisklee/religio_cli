class ReligioCLI::Scraper

  def self.initiate_scraper
    ReligioCLI::Trads.create_from_array(religion_scraper)
    ReligioCLI::Trads.all.each do |religion|
      religion.religion_details(religion_scraper_details(religion.religion_url))
    end
  end

  def self.religion_scraper
    doc = Nokogiri::HTML(open("https://www.patheos.com/library"))
    religion_hashes = []
    doc.css("div.col-lg-3.col-md-4.col-xs-6.remove-padding.related-content.colored.brand-prime-1.religionSquare").each do |content|
      name = content.css("h2.remove-margin.over-dark.text-uppercase").text
      quick_facts = content.css("div.details.text-uppercase").text.strip.gsub("\r\n" + "               ", "")
      religion_url = content.css("a").map{ |link| link['href'] }[0]
      religion_hashes << {:name => name, :url => religion_url, :quick_facts => quick_facts}
    end
    religion_hashes
  end

  def self.religion_scraper_details(religion_url)
    doc = Nokogiri::HTML(open(religion_url))
    description = doc.css("div.dropcap.buffer-bottom").text
    religion_details = {:description => description}
    religion_details
  end

end
