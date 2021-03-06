class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  # GET /cards
  # GET /cards.json
  def index
    @cards = Card.reorder("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    @vote = Vote.new(params[:vote])
    @user = current_user
  end

  # GET /cards/1
  # GET /cards/1.json
  def show
  end

  # GET /cards/new
  def new
    @card = Card.new
    if params[:url]
      @card.url = params[:url]
    end

    if params[:comment]
      @card.poster_comment = params[:comment]
    end
  end

  # GET /cards/1/edit
  def edit
  end

  # POST /cards
  # POST /cards.json
  def create
    url = card_params[:url]

    existing_card = Card.where("url LIKE ?", url).first

    if (existing_card.nil? || existing_card.blank?)
      og_card = OpenGraph.fetch(url)
      @card = Card.new(card_params)
      @card.title = og_card.title if og_card && og_card.has_key?(:title)
      @card.image_url = "http://upload.wikimedia.org/wikipedia/commons/e/eb/Blank.jpg" # Default image
      @card.image_url = og_card.image if og_card && og_card.has_key?(:image)
      @card.description = og_card.description if og_card && og_card.has_key?(:description)
      @card.poster = current_user.name
      @card.poster_uid = current_user.uid
      @card.poster_profile_url = "http://graph.facebook.com/" + @card.poster_uid + "/picture?type=small"
      @card.count_read = 0
      @card.count_liked = 0
      @card.votes_count = 0

      respond_to do |format|
        if @card.save
          format.html { redirect_to @card, notice: 'Card was successfully created.' }
          format.json { render :show, status: :created, location: @card }
        else
          format.html { render :new }
          format.json { render json: @card.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to existing_card, notice: 'Card already exists.' }
        format.json { render :show, status: :created, location: existing_card }
      end
    end
  end

  # PATCH/PUT /cards/1
  # PATCH/PUT /cards/1.json
  def update
    respond_to do |format|
      if @card.update(card_params)
        format.html { redirect_to @card, notice: 'Card was successfully updated.' }
        format.json { render :show, status: :ok, location: @card }
      else
        format.html { render :edit }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cards/1
  # DELETE /cards/1.json
  def destroy
    @card.destroy
    respond_to do |format|
      format.html { redirect_to cards_url, notice: 'Card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card
      @card = Card.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_params
      params.require(:card).permit(:poster_comment, :title, :description, :url, :poster, :count_read, :count_liked, :category, :image_url)
    end
end
