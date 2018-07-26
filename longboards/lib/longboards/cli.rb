class Longboards::CLI

  def start
    puts "Welcome to Warehouse Skateboards!"
    main_menu
  end

  def main_menu
    puts "Type 'list' to view a list of all longboard completes"
    puts "Type 'exit' to exit program"
    input = gets.strip
    if input == "list"
      list_boards
    elsif input == "exit"
      puts "Thank you for visiting Warehouse Skateboards! Please visit again!"
    else
      invalid
      main_menu
    end
  end

  def list_boards
  end

  def invalid
    puts "I'm sorry, I do not understand your response."
  end
end
