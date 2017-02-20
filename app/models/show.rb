require 'pry'

class Show < ActiveRecord::Base

  # attr_accessor :name, :network, :day, :rating
  #
  # def initialize (attributes)
  #   attributes.each {|key, value| self.send(("#{key}="), value)}
  # end

  # def self.create(name:, network:, day:,rating:)
  #   Show.create (name, network, day, rating)
  # end

  def self.highest_rating
       Show.maximum(:rating)
  end

  def self.most_popular_show
    self.order(rating: :desc).first
  end

  def self.lowest_rating
      self.minimum(:rating)
  end

  def self.least_popular_show
       self.order(rating: :asc).first
  end

  def self.ratings_sum
    self.sum(:rating)
  end

  def self.popular_shows
    self.where("rating > ?", 5)
  end

  def self.shows_by_alphabetical_order
    self.order(name: :asc)
  end

end
