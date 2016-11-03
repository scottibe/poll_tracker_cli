require 'pry'
require 'nokogiri'
require 'open-uri'

  

class PollTracker::Scraper  

  attr_accessor :poll

  def self.scrape_page      
    doc = Nokogiri::HTML(open("http://elections.huffingtonpost.com/pollster/2016-general-election-trump-vs-clinton"))  
  end

  def self.avg_results_hash
    results = []
    final_results = {}
    clinton = scrape_page.css("ul#chart-choice-select li label.checked span.value").first.text.gsub("%", "").to_f
    results << clinton
    trump = scrape_page.css("ul#chart-choice-select li label.checked span.value").last.text.gsub("%", "").to_f
    results << trump
    results[0].to_i
    results[1].to_i
    results 
    final_results[:clinton] = results.first
    final_results[:trump] = results.last
    final_results    
  end 

   def self.result_helper
    names = scrape_page.css("div.scrollable-poll-table table#poll-table td.choice") 
  end     

  def self.scrape_result_spread
    spreads = []
    sp = scrape_page.css("div.scrollable-poll-table table#poll-table td.spread")
    sp.collect do |spread|
      spreads << spread.text
    end
    spreads.first(25)  
  end  

  def self.scrape_poll_names
    polls = []
    names = scrape_page.css("div.scrollable-poll-table table#poll-table tbody td.poll div.pollster a")
    names.children.collect do |name|
      polls << name.text
    end
    polls.first(25) 
  end

  def self.trump_results
    @clinton = []
    @trump = []
    @trump, @clinton = all_results.each_with_index.partition { |v| v[1].even?}.map{ |v| v.map{ |v| v[0] }}
    @trump
  end

  def self.clinton_results
    @clinton = []
    @trump = []
    @trump, @clinton = all_results.each_with_index.partition { |v| v[1].even?}.map{ |v| v.map{ |v| v[0] }}
    @clinton
  end 

  def self.poll_names_index
    @names = []
    scrape_poll_names.each.with_index(1) do |name, i|
       @names << "#{i}. " "#{name}"
    end
    @names
  end

  def self.all_results
    @results = []
    result_helper.each do |el|
      @results << el.text
      @results
    end
    @results = @results.first(100)
    @results = @results.delete_if do |num|
      num.to_i < 20
    end  
  end

  def self.scrape_poll_date
    date_array = []
    date = scrape_page.css("tr.poll-single-subpopulation div.dates")
    date.children.each do |dates|
      date_array << dates.text
    end
    date_array.first(25)
  end


  def self.scrape_likely_voters
    vote_array = []
    voters = scrape_page.css("tr.poll-single-subpopulation div.npop")
    voters.children.each do |vote|
      vote_array << vote.text
    end
    vote_array.first(25)
  end
end