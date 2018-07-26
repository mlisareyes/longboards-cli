class Longboards::CLI

  def start
    puts "Welcome to Warehouse Skateboards!"
    main_menu
  end

  def main_menu
    puts "Type 'list' to view a list of all longboard completes"
    puts "Type 'exit' to exit program"
    input = gets.strip
    if input.downcase == "list"
      list_boards
    elsif input.downcase == "exit"
      puts "Thank you for visiting Warehouse Skateboards! See you again soon!"
    else
      invalid
      main_menu
    end
  end

  def list_boards
    #iterate through an array of board objects and list their name
    puts "Listing all longboard completes..."
    Longboards::Scraper.scrape_boards
    boards = Board.all
    boards.each.with_index(1) do |board, index|
      puts "#{index}. #{board.name}"
    end

    input = gets.strip

    if input.to_i.between?(1, Board.all.size)
      index = input.to_i - 1

      board = Board.all[index]
      Longboards::Scraper.scrape_product_page(board)
      display_details(board)

    else
      puts "Thank you."
    end
  end

  def display_details(board)
    puts ""
    puts "Price: #{board.price}"
    puts "description: #{board.details}"
    puts ""
 end

  def invalid
    puts "I'm sorry, I do not understand your response. Please try again."
  end
end
