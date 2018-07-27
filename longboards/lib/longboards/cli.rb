class Longboards::CLI

  def start
    puts "Welcome to Warehouse Skateboards!"
    puts ""
    Longboards::Scraper.scrape_boards
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
      invalid
      main_menu
    end
  end

  def display_details(board)
    puts ""
    puts "Name: #{board.name}"
    puts ""
    puts "Price: #{board.price}"
    puts ""
    puts "Description: #{board.description}"
    puts ""
    puts "Would you like view other longboards? Enter Y or N"
    input = gets.strip
    if input.downcase == "y"
      list_boards
    elsif input.downcase == "n"
      puts "Thank you for visiting Warehouse Skateboards! See you again soon!"
    else
      invalid
    end
  end

  def invalid
    puts "I'm sorry, I do not understand your response. Please try again."
  end
end
