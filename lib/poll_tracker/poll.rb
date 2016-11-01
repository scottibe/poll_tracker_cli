require 'pry'
class PollTracker::Poll

  attr_accessor :name, :date, :polled, :clinton, :trump, :lead

  def initialize
    @name = name
    @date = date
    @polled = polled
    @lead = lead
    @clinton = clinton
    @trump = trump
  end  

  def all_results
    @results = []
    PollTracker::Scraper.result_helper.each do |el|
      @results << el.text
      @results
    end
    @results = @results.first(100)
    @results = @results.delete_if do |num|
      num.to_i < 20
    end  
  end

  def self.poll(input)
    @poll = self.new
    @poll.name = PollTracker::Scraper.poll_names_index[input - 1]
    puts "Poll Source: --------------#{@poll.name}" 
    @poll.clinton = PollTracker::Scraper.clinton_results[input - 1]
    puts "Hillary Clinton: --------#{@poll.clinton}"
    @poll.trump = PollTracker::Scraper.trump_results[input - 1]
    puts "Donald Trump: -----------#{@poll.trump}"
    @poll.lead =  PollTracker::Scraper.scrape_result_spread[input - 1]
    puts "Lead: -------------------#{@poll.lead} Points"
    @poll.date = PollTracker::Scraper.scrape_poll_date[input - 1]
    puts "Dates Polled: -----------#{@poll.date}"
    @poll.polled = PollTracker::Scraper.scrape_likely_voters[input - 1]
    puts "Likely Voters Polled: ---#{@poll.polled}"    
  end
end 

