class ReligioCLI::Trads
  attr_accessor :name, :quick_facts, :url, :description
  @@all = []

  def initialize(religion_hash)
    @name = religion_hash[:name]
    @quick_facts = religion_hash[:quick_facts]
    @url = religion_hash[:url]
    @@all << self
  end

  def self.create_from_array(religion_hash_array)
    religion_hash_array.each {|religion_hash| ReligioCLI::Trads.new(religion_hash)}
  end

  def religion_details(select_details)
    @description = select_details[:description]
  end
  
  def self.all
    @@all
  end

end
