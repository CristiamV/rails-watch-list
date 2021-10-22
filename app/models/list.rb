class List < ApplicationRecord
    has_many :bookmarks, dependent: :destroy
    has_many :movies, through: :bookmarks
    has_many :reviews
    has_one_attached :photo
    validates :name, presence: true, uniqueness: { case_sensitive: false }    
end

# validates :url, format: { with: /www\.\w+\.\w+/ }