class ReligioCLI::Scraper

  def self.initiate_scraper
    ReligioCLI::Trads.create_from_array(religion_scraper)
  end

  def self.religion_scraper
    doc = Nokogiri::HTML(open("https://www.patheos.com/library"))
    religion_hashes = []
    doc.css("div.col-lg-3.col-md-4.col-xs-6.remove-padding.related-content.colored.brand-prime-1.religionSquare").each do |content|
      name = content.css("h2.remove-margin.over-dark.text-uppercase").text
      quick_facts = content.css("div.details.text-uppercase").text.strip.gsub("Origin", "origin\:").gsub("adherents", "adherents\:").gsub("Formed", "formed\:").gsub("\r\n "+"                        ","").upcase
      url = content.css("a").map{ |link| link['href'] }[0]
      religion_hashes << {:name => name, :url => url, :quick_facts => quick_facts}
    end
    religion_hashes
  end

  def self.religion_scraper_details(selected_religion)
    puts '*** scraping'
    doc = Nokogiri::HTML(open(selected_religion.url))
    selected_religion.description =  doc.css("div.dropcap.buffer-bottom").text.strip!
    select_details = {:description => selected_religion.description}
    select_details
    end

end
