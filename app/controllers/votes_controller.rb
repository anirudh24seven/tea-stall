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

    card_id = params[:vote][:card_id].to_i
    uid = params[:vote][:user_id].to_i

    @extant = Vote.where(:cards_id => card_id, :user_id => uid).first

    last_vote_time = @extant.created_at unless @extant.blank?
    curr_time = Time.now

    if (@extant.nil? || @extant.blank?)
      card = Card.where(:id => card_id).first

      updates_votes_count = card.votes_count + 1

      Card.where(:id => card_id).limit(1).update_all(:votes_count => updates_votes_count)

      @vote = Vote.create(:cards_id => card_id, :user_id  => uid)

      respond_to do |format|
        if @vote.save
          format.js {
            render :js => "
            var upvote_button = document.getElementById('upvote_button');
            upvote_button.parentNode.removeChild(element);
            " }
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
