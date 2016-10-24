require 'pry'
class PollTracker::CLI

  def welcome
    input = nil
    puts "POLL TRACKER 2016!! TRUMP vs CLINTON!! THE SHAMING OF AMERICA".red.bold
    puts ""
    sleep(2)
    puts "Hello! I am Poll Tracker! I can show many polls and a poll of those polls. I've even got a few stories to tell.".white.on_blue.bold
    puts "" 
    sleep(1.5)
    puts "To see what's happening in the 2016 Presidential Election type 'Hillary' or 'Trump'".blue.bold
    puts "" 
    
    while input != "exit" do
    input = gets.strip.downcase
      
      if input.downcase == "trump" || input.downcase == "hillary"
        poll_list
      else 
        puts "Rigged! Try again, type 'trump' or 'hillary'. Otherwise, type exit and leave!"       
      end
      if input.downcase == "exit"
        puts "Goodbye. Vote Quimby!"
      end
    end
  end               
  

  def  poll_list 
    list = ["Average of all polls", "poll one", "poll two", "poll three", "poll four", "poll five", "poll six", "poll seven", "poll eight", "poll nine", "poll ten", "poll eleven", "poll twelve", "poll thirteen", "poll fourteen", "poll fifteen"]
    list.each.with_index(1) do |poll, i|
      puts "#{i}. " "#{poll}"
    end
  end        
    #this method should print the list of polls

 

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


end
  




  




