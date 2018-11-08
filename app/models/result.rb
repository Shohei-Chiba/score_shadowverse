class Result < ApplicationRecord
  belongs_to :user
  belongs_to :decks
    def self.sum_pre_win  
        sum(:pre_win)
    end
    
    def self.sum_post_win  
        sum(:post_win)
    end
  
    def self.sum_post_lose  
        sum(:post_lose)
    end
    
    def self.sum_pre_lose  
        sum(:pre_lose)
    end
    
    def self.sum_battle_count
        sum(:pre_win) + sum(:post_win) + sum(:pre_lose) + sum(:post_lose)
    end
end
