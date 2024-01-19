class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
    #allメソッドを使用して、tweetsテーブルすべてのレコードをインスタンス変数に代入し、ビューに受け渡し
  end
end
