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
  def create
    Tweet.create(tweet_params)
    #下のプライベートメソッドの呼び出し
    redirect_to '/'
    #保存後はredirect_toを使用してトップページ表示
  end

  private
  def tweet_params
    #ストロングパラメーター定義
    params.require(:tweet).permit(:name, :image, :text)
    #特定のキーを受け取るように制限
  end
end
