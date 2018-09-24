class Article < ApplicationRecord
    validates :memo,  :presence => true
    validates :title, :presence => true

    has_many :comments
end