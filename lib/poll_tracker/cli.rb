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
    puts "a list goes here"
    #this method should print the list of polls

  end 




end  
  




  




