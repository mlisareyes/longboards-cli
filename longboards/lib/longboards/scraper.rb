require 'pry'
class Longboards::Scraper
  BASE_URL = "https://www.warehouseskateboards.com/"

  def self.scrape_boards
    doc = Nokogiri::HTML(open("https://www.warehouseskateboards.com/longboard-completes"))
    doc.css(".arrayProduct").map do |longboard|
      binding.pry
    end
  end
end
