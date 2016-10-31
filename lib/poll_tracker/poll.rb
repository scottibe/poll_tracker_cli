require 'pry'
class PollTracker::Poll

  @@all = []

  attr_accessor :name, :date, :polled, :clinton, :trump, :lead

  def initialize
    @name = name
    @date = date
    @polled = polled
    @lead = lead
    @clinton = clinton
    @trump = trump
    @@all << self
  end  

  def self.poll(input)
    poll = self.new
    poll.name = PollTracker::Scraper.poll_names_index[input - 1]
    poll.date = PollTracker::Scraper.poll_date[input - 1]
    poll.polled = PollTracker::Scraper.likely_voters[input - 1]
    poll.clinton = PollTracker::Scraper.clinton_results[input - 1]
    poll.trump = PollTracker::Scraper.trump_results[input - 1]
    poll.lead =  PollTracker::Scraper.result_spread[input - 1]
    binding.pry      
  end

end 

