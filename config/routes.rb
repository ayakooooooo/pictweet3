Rails.application.routes.draw do
  devise_for :users
  root to: 'tweets#index'
  resources :tweets
  resources :users, only: :show #マイページを表示する際にはusersコントローラーのshowアクションを動かせるように
  # /users/:idのパスでリクエストした際にusers_controller.rbのshowアクションを実行する
end
