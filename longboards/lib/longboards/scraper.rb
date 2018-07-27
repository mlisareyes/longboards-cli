require 'pry'
class Longboards::Scraper
  BASE_URL = "https://www.warehouseskateboards.com/"

  def self.scrape_boards
    doc = Nokogiri::HTML(open("https://www.warehouseskateboards.com/longboard-completes"))
    doc.css(".arrayProduct").map do |board|
      name = board.css(".arrayDetails").text
      url = board.css("a")[0]["href"]
      board = Board.new(name, url)
    end
  end

  def self.scrape_product_page(board)
    doc = Nokogiri::HTML(open(BASE_URL + board.url))
    board.price = doc.css(".retailprice").text
    board.description = doc.css("div#productinfo").text
  end
end
