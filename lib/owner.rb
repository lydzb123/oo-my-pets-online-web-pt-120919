require 'pry'
class Owner
  attr_reader :name, :species
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    return "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    @@all = []
  end

  def cats
    Cat.all.select { |cat| cat.owner == self}
  end

  def dogs
    Dog.all.select { |dog| dog.owner == self}
  end

  def buy_cat(cat_name)
    owner = self
    Cat.new(cat_name, owner)
  end

  def buy_dog(dog_name)
    owner = self
    Dog.new(dog_name, owner)
  end

  def walk_dogs
    Dog.all.map {|dog| if dog.owner == self
      dog.mood = "happy" end}
  end

  def feed_cats
    Cat.all.map { |cat| if cat.owner == self
      cat.mood = "happy" end}
  end



  def sell_pets
    Cat.all.collect { |cat| cat.mood = "nervous"
      cat.owner = nil }

    Dog.all.collect {|dog| dog.mood = "nervous"
      dog.owner = nil  }
  end

  def list_pets
    return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end



end
