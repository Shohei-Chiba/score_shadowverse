class Result < ApplicationRecord
  belongs_to :user
  
    def self.sum_pre_win  
        sum(:pre_win)
    end
    
    def self.sum_post_win  
        sum(:post_win)
    end
  
    def self.sum_loose  
        sum(:lose)
    end
    
    def self.sum_battle_count
        sum(:pre_win) + sum(:post_win) + sum(:lose)
    end
end
