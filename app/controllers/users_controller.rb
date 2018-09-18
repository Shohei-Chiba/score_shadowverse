class UsersController < ApplicationController
  def show
    
    names =  ["エルフ", "ロイヤル", "ウィッチ" ,"ドラゴン", "ネクロマンサー", "ヴァンパイア", "ビショップ", "ネメシス"]

    @results = Hash.new
    
    @user = User.find(current_user.id)
    
    @t = Result.all
    
    count = 0
    
    @elf = Result.where(:name => "エルフ", :user_id => current_user.id)
    
    names.each do |name|
      @e = Result.where(:user_id => current_user.id, :name => name) 
      @results[count]  = {:pre_win => @e.sum_pre_win, :post_win => @e.sum_post_win, :pre_lose => @e.sum_pre_lose, :post_lose => @e.sum_post_lose,:count => @e.sum_battle_count }
      count += 1
    end
  end
  
  def moreinfo
    @name = params[:name]
    @decks = ["エルフ","ロイヤル", "ウィッチ","ドラゴン","ネクロマンサー","ヴァンパイア","ビショップ","ネメシス" ]
    @data = Result.where(:name => params[:name], :user_id => current_user.id)
    @score = Hash.new
    
    @decks.each do |deck|
      @score[deck.to_s] = {:win => 0, :lose => 0}
    end
  end
  
  
end
