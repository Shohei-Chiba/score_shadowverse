class DecksController < ApplicationController
  before_action :set_deck, only: [:show, :edit, :update, :destroy]

  # GET /decks
  # GET /decks.json
  def index
    @decks = Deck.where(:user_id => current_user.id)
  end

  # GET /decks/1
  # GET /decks/1.json
  def show
  end

  # GET /decks/new
  def new
    @deck = Deck.new

  end

  # GET /decks/1/edit
  def edit
  end

  # POST /decks
  # POST /decks.json
  def create
    @deck = Deck.new(deck_params)
    @deck.user_id = current_user.id

    respond_to do |format|
      if @deck.save
        score(deck_params,@deck.id)
        format.html { redirect_to users_show_path(current_user.id), notice: 'Deck was successfully created.' }
        format.json { render :show, status: :created, location: @deck }
      else
        format.html { render :new }
        format.json { render json: @deck.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /decks/1
  # PATCH/PUT /decks/1.json
  def update
    respond_to do |format|
      if @deck.update(deck_params)
        score_update(deck_params)
        format.html { redirect_to @deck, notice: 'Deck was successfully updated.' }
        format.json { render :show, status: :ok, location: @deck }
      else
        format.html { render :edit }
        format.json { render json: @deck.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /decks/1
  # DELETE /decks/1.json
  def destroy
    @result = Result.where(:deck_id => @deck.id)
    Result.destroy(@result.ids)
    @deck.destroy
    respond_to do |format|
      format.html { redirect_to decks_url, notice: 'Deck was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deck
      @deck = Deck.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def deck_params
      params.require(:deck).permit(:mydeck, :Opponentdeck, :Ahead, :result)
    end
    
    def score(params,deck_id)
      
      pre_win = (params[:Ahead] == "先攻" && params[:result] == "勝ち") ? 1 : 0;
      post_win = (params[:Ahead] == "後攻" && params[:result] == "勝ち") ? 1 : 0; 
      lose = (params[:result] == "負け") ? 1 : 0;
      
      puts params[:Ahead]
      
      @result = Result.new(:name => params[:mydeck], :user_id => current_user.id, :pre_win => pre_win, :post_win => post_win, :lose => lose,:deck_id => deck_id)
      @result.save!
    end
    
    def score_update(params)
      pre_win = (params[:Ahead] == "先攻" && params[:result] == "勝ち") ? 1 : 0;
      post_win = (params[:Ahead] == "後攻" && params[:result] == "勝ち") ? 1 : 0; 
      lose = (params[:result] == "負け") ? 1 : 0;
    puts "-------------------------------------"
    @result = Result.where(:deck_id => params[:id]).each do |t|
      puts t
    end
    puts "-------------------------------------"
    @result.update!(:name => params[:mydeck], :pre_win => pre_win, :post_win => post_win, :lose => lose)
    @result.save!
    end  
end
