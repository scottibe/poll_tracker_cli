require 'pry'
class PollTracker::CLI

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
    puts "----Currently, the average of more than 300 polls shows:----".blue.on_light_white
    puts ""
    sleep(1.5)
    score = PollTracker::Scraper.avg_results_hash
    puts "*****HILLARY CLINTON***** =====> #{score[:clinton]}***********************".light_white.on_light_blue.underline
    puts "*****DONALD TRUMP?******* =====> #{score[:trump]}************ Seriously?".light_white.on_light_blue
    puts "" 
    sleep(1.5)
    puts "Type 'YesHillary' or 'NeverTrump' to see a list of the 25 most recent polls."
    puts "Type 'exit' if this makes you sick and want to leave. PollTracker understands."

    while input != "exit" 
    input = gets.strip.downcase
      
      if input.downcase == "nevertrump" || input.downcase == "yeshillary"
        list_polls
        show_poll     
      else 
        puts "Rigged! Try again, type 'NeverTrump' or 'YesHillary'. Otherwise, type exit and leave!"       
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
    poll_number = poll_number.to_i - 1
    if poll_number.between?(0, 24)
      @poll = PollTracker::Poll.new_poll(poll_number)
      puts ""
      puts "Poll Source:-------------#{@poll.name}" 
      puts "Hillary Clinton: --------#{@poll.clinton}%"
      puts "Donald Trump: -----------#{@poll.trump}%"
      puts "Lead: -------------------#{@poll.lead} Points"
      puts "Dates Polled: -----------#{@poll.date}"
      puts "Likely Voters Polled: ---#{@poll.polled}"
      puts ""
      puts "Type 'YesHillary' or 'NeverTrump' to see go back to list."
      puts "Or type 'exit' to leave"

    elsif
      puts "That is not a valid selection. 
      Please type 'NeverTrump' or 'YesHillary' and choose again"
    end    
  end
end
    