require 'pry'
require 'nokogiri'
require 'open-uri'
class PollTracker::Poll
  attr_accessor :name, :winning_cand, :losing_cand, :other, :undecided, :date, :polled

  def initialize
    @name = name
    @winning_cand = winning_cand
    @losing_cand = losing_cand
    @other = other
    @undecided = undecided
    @date = date
    @polled = polled
  end  


  

  #this method will be below list of polls, 
  def set_name_attribute
    name_hash = {}
    top_polls = PollTracker::Poll.polls
    binding.pry
    top_polls = top_polls.first(25)
    top_polls.each.with_index(1) do |poll, i|
      i = :name
      name_hash[i] = "#{poll}"
    end
    puts name_hash
  end  

def set_name_attribute
  name_hash = {}
  top_polls = PollTracker::Poll.polls
  top_polls = top_polls.first(25)
  top_polls.each.with_index(1) do |poll, i|
    i = :name
    name_hash[i] = "#{poll}"
  end  
  puts name_hash
end  

end 

#   def candidates
#     candidates = doc.css("div.scrollable-poll-table table#poll-table tr th.choice").text.split(/([[:upper:]][[:lower:]]*)/).delete_if(&:empty?)


#   end
    
# end
     


    # poll = self.new
    # poll.name = "name"
    # poll.winning_cand = "49.2%"
    # poll.losing_cand = "41.4%"
    # poll.other = "6%"
    # poll.undecided = "9%"
    # poll.date = "Oct. 19 -- Oct. 24"
    # poll.polled = "873 likely voters"
    # poll
  

  


  #  def list_polls
  # polls = PollTracker::Poll.poll_names
  # polls = polls.first(25)
  #   polls.each.with_index(1) do |poll, i|
  #     puts "#{i}. " "#{poll}"
  #   end 
  # end


























#   @@all = []

#   def initialize(name)
#     @name = name
#     @winning_cand = winning_cand
#     @losing_cand = losing_cand
#     @other = other
#     @undecided = undecided
#     @date = date
#     @voters = voters
    
#     @@all << self
#   end

#   def self.all 
#     @@all 
#   end  


#   def self.get_page 
#     doc = Nokogiri::HTML(open("http://elections.huffingtonpost.com/pollster/2016-general-election-trump-vs-clinton"))  
#   end

  # def self.poll_names
  #   polls = []
  #   names = get_page.css("div.scrollable-poll-table table#poll-table tbody td.poll div.pollster a")
  #   names.children.collect do |name|
  #     polls << name.text
  #   end
  #   polls
  # end

#   def create_from_name(poll_names) 
#     polls = []
#     poll_names.each do |name|
#       poll = Poll.new(name)
#       polls << poll 
#     end
#     polls
#   end



# end      





  # def self.create_by_page 
      
  #   results = get_page.css("div.scrollable-poll-table table#poll-table tr th.choice")
  #   binding.pry
  # end




  # def self.create_new_poll

  # end











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
