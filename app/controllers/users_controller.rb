class UsersController < ApplicationController
  def show
    #ログイン中ユーザーのマイページ
    @nickname = current_user.nickname #ニックネーム
    @tweets = current_user.tweets #ログイン中のユーザーのツイート投稿
  end
end
