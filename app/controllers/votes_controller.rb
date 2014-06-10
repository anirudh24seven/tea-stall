class VotesController < ApplicationController

  # GET /votes/new
  # GET /votes/new.xml
  def new
    @vote = Vote.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @vote }
    end
  end

  # POST /votes
  # POST /votes.xml
  def create

    card = params[:vote][:card_id].to_i
    uid = params[:vote][:user_id].to_i

    #@extant = Vote.find(:conditions => {:cards_id => card.to_i, :user_id => uid.to_i})
    @extant = Vote.where(:cards_id => card, :user_id => uid).first

    puts @extant.inspect, @extant.nil?.inspect, @extant.blank?.inspect

    last_vote_time = @extant.created_at unless @extant.blank?
    curr_time = Time.now

    if (@extant.nil? || @extant.blank?)
      @vote = Vote.create(:cards_id => card, :user_id  => uid)
      respond_to do |format|
        if @vote.save
          format.js
          format.html { redirect_to :back }
        else
          format.html { redirect_to cards_path }
          format.xml  { render :xml => @vote.errors, :status => :unprocessable_entity }
        end
      end
    else
      render :js =>  "alert('You have already voted for this.');"
    end
  end
end
