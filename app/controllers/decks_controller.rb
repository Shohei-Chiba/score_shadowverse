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
        format.html { redirect_to users_show_path(current_user.id) }
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
        score_update(deck_params, @deck.id)
        format.html { redirect_to @deck, notice: '更新されました' }
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
      format.html { redirect_to decks_url, notice: '削除されました' }
      format.json { head :no_content }
    end
  end
  
  def destroy_all_deck
    puts params
    Deck.destroy(Deck.where(:user_id => current_user.id, :mydeck => params[:format]).ids)
    Result.destroy(Result.where(:user_id => current_user.id, :name => params[:format]).ids)
    redirect_to users_show_path
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
      pre_lose = (params[:Ahead] == "先攻" && params[:result] == "負け") ? 1 : 0;
      post_lose = (params[:Ahead] == "後攻" && params[:result] == "負け") ? 1 : 0;
      
      puts params[:Ahead]
      
      @result = Result.new(:name => params[:mydeck], :user_id => current_user.id, :pre_win => pre_win, :post_win => post_win, :pre_lose => pre_lose, :post_lose => post_lose, :deck_id => deck_id)
      @result.save!
    end
    
    def score_update(params, deck_id)
      pre_win = (params[:Ahead] == "先攻" && params[:result] == "勝ち") ? 1 : 0;
      post_win = (params[:Ahead] == "後攻" && params[:result] == "勝ち") ? 1 : 0; 
      pre_lose = (params[:Ahead] == "先攻" && params[:result] == "負け") ? 1 : 0;
      post_lose = (params[:Ahead] == "後攻" && params[:result] == "負け") ? 1 : 0;
      @result = Result.where(:deck_id => deck_id)
      @result.update_all(:name => params[:mydeck], :pre_win => pre_win, :post_win => post_win, :pre_lose => pre_lose, :post_lose => post_lose)
    end  
end
