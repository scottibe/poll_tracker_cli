require 'pry'
require 'nokogiri'
require 'open-uri'
class PollTracker::Poll
  attr_accessor :name, :winning_cand, :losing_cand, :other, :undecided, :date, :voters

  @@all = []

  def initialize
    @name = name
    @winning_cand = winning_cand
    @losing_cand = losing_cand
    @other = other
    @undecided = undecided
    @date = date
    @voters = voters
    
    @@all << self
  end

  def self.all 
    @@all 
  end  


  def self.get_page 
    doc = Nokogiri::HTML(open("http://elections.huffingtonpost.com/pollster/2016-general-election-trump-vs-clinton"))  
  end

  def self.poll_names
    polls = []
    names = get_page.css("div.scrollable-poll-table table#poll-table tbody td.poll div.pollster a")
    names.children.collect do |name|
      polls << name.text
    end
    polls
  end


  # def self.create_by_page 
      
  #   results = get_page.css("div.scrollable-poll-table table#poll-table tr th.choice")
  #   binding.pry
  # end




  # def self.create_new_poll

  # end

end  









# Huffpost model - poll of polls - 326 pols from 42 pollsters
  # Clinton name - doc.css("ul#chart-choice-select li label.checked span.choice").first.text
  # Clinton number - doc.css("ul#chart-choice-select li label.checked span.value").first.text.gsub("%", "").to_f
  # Trump name - doc.css("ul#chart-choice-select li label.checked span.choice").last.text
  # Trump number - doc.css("ul#chart-choice-select li label.checked span.value").last.text.gsub("%", "").to_f     

  #Polls
  # candidates names(including "other", "undecided" and "spread") iterate w/ #each
  # doc.css("div#pollster-polls div.scrollable-poll-table table#poll-table").first
  
  # doc.css("div.scrollable-poll-table table#poll-table tr th.choice").each_with_index do |cand, i|
  #    puts "#{i+1}. #{cand.text}"
  # end
  # STDOUT the following
  # 1. Trump
  # 2. Clinton
  # 3. Other
  # 4. Undecided 

  #candidates = doc.css("div.scrollable-poll-table table#poll-table tr th.choice").text.split(/([[:upper:]][[:lower:]]*)/).delete_if(&:empty?)
  # this will return the following array:
  # ["Trump", "Clinton", "Other", "Undecided"]

  # doc.css("div.scrollable-poll-table table#poll-table tr th.spread").text
  # returns the word 'Spread' number 5 on the list above
