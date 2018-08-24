class UsersController < ApplicationController
  def show
    
    names =  ["エルフ", "ロイヤル", "ウィッチ" ,"ドラゴン", "ネクロマンサー", "ヴァンパイア", "ビショップ", "ネメシス"]

    @results = Hash.new
    
    @user = User.find(current_user.id)
    
    @t = Result.all
    
    count = 0
    
    names.each do |name|
      @e = Result.where(:user_id => current_user.id, :name => name) 
      @results[count]  = {:pre_win => @e.sum_pre_win, :post_win => @e.sum_post_win, :lose => @e.sum_loose, :count => @e.sum_battle_count }
      count += 1
    end
  end
end
