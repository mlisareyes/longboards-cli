class Board
  #what attributes will a board have
  attr_accessor :name, :url, :price, :description

  @@all = []

  def initialize(name, url)
    @name = name
    @url = url
    @@all << self
  end



  def self.all
    @@all
  end
end
