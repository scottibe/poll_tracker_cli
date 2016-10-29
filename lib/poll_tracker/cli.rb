require 'pry'
class PollTracker::CLI

  def call
    welcome
  end  

  def welcome
    input = nil
    puts "POLL TRACKER 2016!! TRUMP vs CLINTON!! THE SHAMING OF AMERICA".red.bold
    puts ""
    # sleep(2)
    puts "Hello! I am Poll Tracker! I can show many polls and a poll of those polls. I've even got a few stories to tell.".white.on_blue.bold
    puts "" 
    # sleep(1.5)
    puts "To see what's happening in the 2016 Presidential Election type 'Hillary' or 'Trump'".blue.bold
    puts "" 
    while input != "exit" 
    input = gets.strip.downcase
      
      if input.downcase == "trump" || input.downcase == "hillary"
        list_polls     
      else 
        puts "Rigged! Try again, type 'trump' or 'hillary'. Otherwise, type exit and leave!"       
      end
      if input.downcase == "exit"
        puts "Goodbye. Vote Quimby!"
      end
    end
  end      


  def list_polls
    puts PollTracker::Scraper.poll_names_w_numbers
    puts "Please choose the number of the poll you would like to see."
    puts "Enter a number between 1-25"
    input = gets.strip
    if input.to_i.between?(1, 25)
      puts PollTracker::Scraper.poll_names_w_numbers[input.to_i - 1]
      puts "Type 'Hillary' or 'Trump' to see go back to list."  
    elsif
      puts "That is not a valid selection. Please pick again"
      input_2.to_i.between?(1, 25)
      puts PollTracker::Scraper.poll_names_w_numbers[input_2.to_i - 1] 
    else
      exit
    end    
  end



end
    





  
  #  this method will be below list of polls, 
  # def list_polls
  # polls = PollTracker::Poll.poll_names
  # polls = polls.first(25)
  #   polls.each.with_index(1) do |poll, i|
  #     puts "#{i}. " "#{poll}"
  #   end 
  # end

  # def poll_objects
  #   puts  PollTracker::Poll.create_from_name
  # end  




     
     
   

 

#   def stories
#   # this method will be below list of polls, it's only responsibility is to ask for user
#   # user input and go to a list of news stories if user selects 'yes'
#   puts "Poll Tracker knows the news, would you like to read about the election? y/n"

#   input.downcase = gets.strip
#   if input.downcase == 'y' || input.downcase == 'yes'
#     headlines
#   else 
#     puts ""  

#   end  

# end





  




