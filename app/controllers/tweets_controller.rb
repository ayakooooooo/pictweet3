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

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to root_path
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params)
    redirect_to root_path
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  private
  def tweet_params
    #ストロングパラメーター定義
    params.require(:tweet).permit(:name, :image, :text)
    #特定のキーを受け取るように制限
  end
end
