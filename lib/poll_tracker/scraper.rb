require 'pry'
require 'nokogiri'
require 'open-uri'


class PollTracker::Scraper  

  def call

    candidate_list
  end  

  def self.get_page      
    doc = Nokogiri::HTML(open("http://elections.huffingtonpost.com/pollster/2016-general-election-trump-vs-clinton"))  
  end

  def self.candidate_list_w_spread
    @candidates = get_page.css("div.scrollable-poll-table table#poll-table tr th.choice").text.split(/([[:upper:]][[:lower:]]*)/).delete_if(&:empty?)
    @candidates = @candidates.insert(0, @candidates.delete_at(1))
    @candidates
    @spread = get_page.css("div.scrollable-poll-table table#poll-table tr th.spread").text
    @candidates << @spread
  end

  def self.avg_results_hash
    @results = []
    @final_results = {}
    @clinton = get_page.css("ul#chart-choice-select li label.checked span.value").first.text.gsub("%", "").to_f
    @results << @clinton
    @trump = get_page.css("ul#chart-choice-select li label.checked span.value").last.text.gsub("%", "").to_f
    @results << @trump
    @results[0].to_i
    @results[1].to_i
    @results 
    @final_results[:clinton] = @results.first
    @final_results[:trump] = @results.last
    @final_results    
  end 

   def self.result_helper
    polls = []
    names = get_page.css("div.scrollable-poll-table table#poll-table td.choice") 
    names
  end  

  def self.all_poll_results
    results = []
    result_helper.each do |el|
      results << el.text
      results
    end
    results.first(100)
  end

  def self.result_spread
    @spreads = []
    sp = get_page.css("div.scrollable-poll-table table#poll-table td.spread")
    sp.collect do |spread|
      @spreads << spread.text
    end
    @spreads.first(25)  
  end  

  def self.poll_names
    polls = []
    names = get_page.css("div.scrollable-poll-table table#poll-table tbody td.poll div.pollster a")
    names.children.collect do |name|
      polls << name.text
    end
    polls.first(25) 
  end

  def self.poll_names_w_numbers
    names = []
    poll_names.each.with_index(1) do |name, i|
       names << "#{i}. " "#{name}"
    end
    names
  end

  def self.poll_date
    @date_array = []
    @date = get_page.css("tr.poll-single-subpopulation div.dates")
    @date.children.each do |dates|
      @date_array << dates.text
    end
    @date_array.first(25)
  end


  def self.likely_voters
    @vote_array = []
    @voters = get_page.css("tr.poll-single-subpopulation div.npop")
    @voters.children.each do |vote|
      @vote_array << vote.text
    end
    @vote_array.first(25)
  end
 
end  

