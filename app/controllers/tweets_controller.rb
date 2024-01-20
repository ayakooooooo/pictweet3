class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
    #allメソッドを使用して、tweetsテーブルすべてのレコードをインスタンス変数に代入し、ビューに受け渡し
  end
  def new
    @tweet = Tweet.new
    #投稿画面へ遷移（画面移動）する
    #Tweetクラスのインスタンス変数を生成
  end
end
