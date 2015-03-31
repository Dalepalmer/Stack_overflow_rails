Rails.application.routes.draw do
  devise_for :users
  root :to => 'home#index'

  resources :questions do
    resources :answers, :except => [:show, :index]
  end

end
