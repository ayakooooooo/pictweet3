class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]#リダイレクト処理
  #indexアクションにアクセスした場合、indexアクションへのリダイレクトを繰り返してしまい、無限ループが起こります。この対策
  #ログインしていなくても、詳細ページに遷移できる仕様にするためにexcept: [:index, :show]
  
  def index
    @tweets = Tweet.includes(:user)
    #includesメソッドを使用してN+1問題を解消
    #変更前 @tweets = Tweet.all allメソッドを使用して、tweetsテーブルすべてのレコードをインスタンス変数に代入し、ビューに受け渡し
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
  end

  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params)
    redirect_to root_path
  end

  def show
  end

  private
  def tweet_params
    #ストロングパラメーター定義
    params.require(:tweet).permit(:name, :image, :text).merge(user_id: current_user.id)
    #特定のキーを受け取るように制限
    #tweetの情報を持つハッシュと、user_idを持つハッシュを結合
  end
  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
  def move_to_index
    unless user_signed_in? #ログインしていない状態
      redirect_to action: :index #indexアクションのindex.html.erbページにリダイレクト
    end
  end
end
