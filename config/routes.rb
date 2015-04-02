Rails.application.routes.draw do

  devise_for :users
  resources :topics do
    resources :posts, except: [:index]
  end
  resources :summaries do
    resources :posts
  end
  
  get 'about' => 'welcome#about'


root to: 'welcome#index'
end
