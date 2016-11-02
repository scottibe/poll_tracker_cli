require 'pry'
class PollTracker::Poll

  attr_accessor :name, :date, :polled, :clinton, :trump, :lead

  def initialize(input)
    @name = name
    @date = date
    @polled = polled
    @lead = lead
    @clinton = clinton
    @trump = trump
  end 

  # def new_poll(input)
  #   @poll = self.new(input)
  # end  

  def poll_name(input) 
    @poll.name = PollTracker::Scraper.scrape_poll_names[input - 1]
  end
    
  def clinton_result(input)
    @poll.clinton = PollTracker::Scraper.clinton_results[input - 1]
  end
  
  def trump_result(input)
    @poll.trump = PollTracker::Scraper.trump_results[input - 1]
  end
  
  def lead(input)
    @poll.lead = PollTracker::Scraper.scrape_result_spread[input - 1]   
  end     

  def date(input) 
    @poll.date = PollTracker::Scraper.scrape_poll_date[input - 1]
  end
  
  def polled(input)  
     @poll.polled = PollTracker::Scraper.scrape_likely_voters[input - 1]
  end
end    


  