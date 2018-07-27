require 'pry'
class Longboards::Scraper
  def self.scrape_boards
    doc = Nokogiri::HTML(open("https://www.warehouseskateboards.com/longboard-completes"))
    doc.css(".arrayProduct").each do |board|
      name = board.css("a")[1]["title"]
      url = board.css("a")[0]["href"]
      board = Board.new(name, url)
    end
  end

  def self.scrape_product_page(board)
    doc = Nokogiri::HTML(open(board.url))
    board.name = doc.css("h1").text.strip
    board.price = doc.css(".retailprice").text.strip
    board.description = doc.css("p")[1].text.strip
  end
end
