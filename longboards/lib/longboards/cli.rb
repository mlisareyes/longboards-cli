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
  end

  def invalid
    puts "I'm sorry, I do not understand your response. Please try again."
  end
end
