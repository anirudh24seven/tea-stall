class FeedController < ApplicationController
  def development
    @cards = Card.where("LOWER(category) LIKE ?", "development").reorder("created_at DESC").paginate(:page => params[:page], :per_page => 10)
  end

  def design
    @cards = Card.where("LOWER(category) LIKE ?", "design").reorder("created_at DESC").paginate(:page => params[:page], :per_page => 10)
  end

  def business
    @cards = Card.where("LOWER(category) LIKE ?", "business").reorder("created_at DESC").paginate(:page => params[:page], :per_page => 10)
  end

  def growth
    @cards = Card.where("LOWER(category) LIKE ?", "growth").reorder("created_at DESC").paginate(:page => params[:page], :per_page => 10)
  end
end
