class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  has_many :tweets
  #1人のユーザーは複数の投稿を所有
  #has_manyメソッド userと他のモデルとの間に「1対多」のつながりがあることを示す
end
