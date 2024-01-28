class Tweet < ApplicationRecord
  validates :text, presence: true
  belongs_to :user
  #投稿は必ず1人のユーザーに所属
  #belongs_toメソッド Tweetモデルと他のモデル（User）との間に「1対1」のつながりがあることを示す
end
