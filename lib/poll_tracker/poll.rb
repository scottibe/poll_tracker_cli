require 'pry'
class PollTracker::Poll
  attr_accessor :name, :trump, :clinton, :other, :undecided, :date, :voters 

  @@all = []

  def initialize(name)
    @name = name
    @trump = trump
    @clinton= clinton
    @other = other
    @undecided = undecided
    @date = date
    @voters = voters
    @@all << self
  end

  def self.all 
    @@all 
  end  

  

end  