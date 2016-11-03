require 'pry'
class PollTracker::CLI

  # def initialize
  #   @poll = PollTracker::Poll.new
  # end   

  def call
    welcome 
  end  

  def welcome
    input = nil
    puts "***********POLL TRACKER 2016!! TRUMP vs CLINTON!!***********".white.on_light_red
    puts "*****************THE SHAMING OF AMERICA!!!!*****************".white.on_light_red
    puts ""
    sleep(1.5 )
    puts "----Hello! I am Poll Tracker! I can show you many polls.----".blue.on_light_white
    puts "----I will also get you news stories about the election.----".blue.on_light_white 
    puts "----Currently, the average of more than 300 polls shows:----".blue.on_light_white
    puts ""
    sleep(2)
    score = PollTracker::Scraper.avg_results_hash
    puts "*****HILLARY CLINTON***** =====> #{score[:clinton]}***********************".light_white.on_light_blue.underline
    puts "*****DONALD TRUMP?******* =====> #{score[:trump]}********WTF! Seriously?".light_white.on_light_blue
    puts "" 
    sleep(2)
    puts "Type 'YesHillary' or 'NeverTrump' to see a list of the 25 most recent polls."
    puts "Type 'exit' if this makes you sick and want to leave. PollTracker understands."

    while input != "exit" 
    input = gets.strip.downcase
      
      if input.downcase == "nevertrump" || input.downcase == "yeshillary"
        list_polls
        show_poll     
      else 
        puts "Rigged! Try again, type 'NoTrump' or 'YesHillary'. Otherwise, type exit and leave!"       
      end
      if input.downcase == "exit"
        puts "Goodbye. Vote Quimby!"
      end
    end
  end      


  def list_polls
    puts PollTracker::Scraper.poll_names_index
  end
  
  def show_poll  
    puts "Please choose the number of the poll you would like to see."
    puts "Enter a number between 1-25"

    poll_number = gets.strip
    if poll_number.to_i.between?(1, 25)
      @poll = PollTracker::Poll.new_poll(poll_number)
      
      puts "Poll Source:-------------#{@poll.name}" 
      puts "Hillary Clinton: --------#{@poll.clinton_result}"
      puts "Donald Trump: -----------#{@poll.trump_result}"
      puts "Lead: -------------------#{@poll.lead} Points"
      puts "Dates Polled: -----------#{@poll.date}"
      puts "Likely Voters Polled: ---#{@poll.polled}"

      puts "Type 'YesHillary' or 'NeverTrump' to see go back to list."

    elsif
      puts "That is not a valid selection. Please pick again"
      again = gets.strip
      again.to_i.between?(1, 25)
      puts "hey"  #ignore this part and everything below
      PollTracker::Poll.poll(again.to_i)
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





  




