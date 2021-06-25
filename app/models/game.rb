class Game < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  #　バリデーションの設定
  validates :title ,presence: true
  validates :body ,presence: true
end
