require 'pry'
class PollTracker::Poll

  attr_accessor :name, :date, :polled, :clinton, :trump, :lead

  @@all = []

  def initialize
    @name = name
    @date = date
    @polled = polled
    @lead = lead
    @clinton = clinton
    @trump = trump
    @@all << self
  end 
    
  def self.all 
    @@all 
  end  

  def names(input)
    PollTracker::Scraper.scrape_poll_names[input.to_i]
  end
    
  def clinton_results(input)
    PollTracker::Scraper.clinton_results[input.to_i]
  end
  
  def trump_results(input)
    PollTracker::Scraper.trump_results[input.to_i]
  end
  
  def leads(input)
    PollTracker::Scraper.scrape_result_spread[input.to_i]   
  end     

  def dates(input)
    PollTracker::Scraper.scrape_poll_date[input.to_i]
  end
  
  def number_polled(input) 
     PollTracker::Scraper.scrape_likely_voters[input.to_i]
  end

  def self.new_poll(input)    
    @poll = self.new
    @poll.name = @poll.names(input)
    @poll.clinton = @poll.clinton_results(input)
    @poll.trump = @poll.trump_results(input)
    @poll.lead = @poll.leads(input)
    @poll.date = @poll.dates(input)
    @poll.polled = @poll.number_polled(input) 
    @poll
  end
end