class FeedController < ApplicationController
  def development
    @cards = Card.select{|card| card.category.casecmp('development')==0}
  end

  def design
    @cards = Card.select{|card| card.category.casecmp('design')==0}
  end

  def business
    @cards = Card.select{|card| card.category.casecmp('business')==0}
  end

  def growth
    @cards = Card.select{|card| card.category.casecmp('growth')==0}
  end
end
