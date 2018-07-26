require 'pry'
class Longboards::Scraper
  BASE_URL = "https://www.warehouseskateboards.com/"

  def self.scrape_boards
    doc = Nokogiri::HTML(open("https://www.warehouseskateboards.com/longboard-completes"))
    doc.css(".arrayProduct").map do |longboard|
      name = longboard.css(".arrayDetails").text
      url = longboard.css("a")[0]["href"]
      board = Board.new(name, url)
    end
  end

  def self.scrape_product_page
    doc = Nokogiri::HTML(open(BASE_URL + board.url))
    board.price
    board.description
  end
end
